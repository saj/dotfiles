# Remain backwards compatible with Python 2.6 for now.

env = Environment()
Export("env")

SConscript([".ssh/SConscript"])

m4_templates = File([".gvimrc.m4", ".tmux.conf.m4"])
for template in m4_templates:
    env.Command("${SOURCE.base}", template, "m4 $SOURCE > $TARGET")
