#!/usr/bin/python

import os
import subprocess

class PluginManager():
	def __init__(self):
		self.bundlePath = os.path.join(os.getenv("HOME"), ".vim", "bundle")
		self.title = "Enable or disable a Vim plugin"
		self.enabled = []
		self.disabled = []
		self.proc = None
		self.getPlugins()

	def getPlugins(self):
		directories = []
		for file in os.listdir(self.bundlePath):
			if os.path.isdir(os.path.join(self.bundlePath, file)):
				directories.append(file)
		if not directories:
			print(f"no directories found at path {self.bundlePath}")
			exit()
		for directory in directories:
			if directory.endswith("~"):
				self.disabled.append(directory)
			else:
				self.enabled.append(directory)

	def selectEnabled(self) -> str:
		self.proc = subprocess.Popen(f'zenity --list --title="{self.title}" --column="enabled plugins" {" ".join(self.enabled)}', stdout=subprocess.PIPE, shell=True, universal_newlines=True)
		out = self.proc.communicate()[0]
		self.proc.wait()
		return  str(out).strip()

	def selectDisabled(self) -> str:
		self.proc = subprocess.Popen(f'zenity --list --title="{self.title}" --column="disabled plugins" {" ".join(self.disabled)}', stdout=subprocess.PIPE, shell=True, universal_newlines=True)
		out = self.proc.communicate()[0]
		self.proc.wait()
		return str(out).strip()

	def askWhich(self) -> int:
		self.proc = subprocess.Popen(f'zenity --question --title="{self.title}" --text="Which plugins to list?" --ok-label="disabled" --cancel-label="enabled"', stdout=subprocess.PIPE, shell=True)
		self.proc.communicate()
		status = self.proc.wait()
		return status

	def enablePlugin(self, plugin: str):
		name = plugin[:-1]
		self.proc = subprocess.Popen(f'zenity --question --title={self.title} --text="Are you sure you want to enable {name} plugin?"', stdout=subprocess.PIPE, shell=True)
		self.proc.communicate()
		status = self.proc.wait()
		if status == 0:
			os.rename(os.path.join(self.bundlePath, plugin), os.path.join(self.bundlePath, name))
			os.popen(f'zenity --info --title={self.title} --text="Successfully enabled {name} plugin"')

	def disablePlugin(self, plugin: str):
		self.proc = subprocess.Popen(f'zenity --question --title={self.title} --text="Are you sure you want to disable {plugin} plugin?"', stdout=subprocess.PIPE, shell=True)
		self.proc.communicate()
		status = self.proc.wait()
		if status == 0:
			os.rename(os.path.join(self.bundlePath, plugin), os.path.join(self.bundlePath, plugin) + "~")
			os.popen(f'zenity --info --title={self.title} --text="Successfully disabled {plugin} plugin"')

if __name__ == "__main__":
	manager = PluginManager()
	if manager.askWhich(): #enabled
		plugin = manager.selectEnabled()
		if not plugin:
			exit()
		manager.disablePlugin(plugin)
	else: #disabled
		plugin = manager.selectDisabled()
		if not plugin:
			exit()
		manager.enablePlugin(plugin)
