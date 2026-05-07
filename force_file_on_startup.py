import sublime
import sublime_plugin

class ForceFileOnStartup(sublime_plugin.EventListener):
    def on_activated(self, view):
        if view.file_name() is None and not view.settings().get("force_file_checked"):
            view.settings().set("force_file_checked", True)
            sublime.set_timeout(lambda: view.window().run_command("prompt_save_as"), 100)
# 放到 C:\Users\UserName\AppData\Roaming\Sublime Text\Packages\User\