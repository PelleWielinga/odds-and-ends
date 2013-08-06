import sublime
import sublime_plugin
import os
import string
import re

class OpenTaskPicker(sublime_plugin.TextCommand):
	tasks = []

	def __init__(self, *args, **kwargs):
		super(OpenTaskPicker, self).__init__(*args, **kwargs)
		self.tool = RakeBuildTool()

	def run(self, edit):
		window = sublime.active_window()
		window.show_quick_panel(['Refresh'] + OpenTaskPicker.tasks, self.runTask)

	def runTask(self, index):
		if index == 0:
			OpenTaskPicker.tasks = self.tool.getTasks()
		elif index > 0:
			self.tool.runTask(OpenTaskPicker.tasks[index - 1][0])


class RakeBuildTool():

	def getTasks(self):
		allTasks = []
		for task in string.split(os.popen("rake --tasks").read(), "\n"):
			match = re.search('rake ([^\s]+)\s+(?:# (.*))?', task)
			if match != None:
				taskName = match.group(1)
				taskDesc = match.group(2)
				allTasks = allTasks + [[taskName, taskDesc]]
		return allTasks

	def runTask(self, task):
		os.popen("gnome-terminal -x rake " + task)
