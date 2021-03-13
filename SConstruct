env = Environment()
Export("env")

SConscript([".ssh/SConscript"])

m4_templates = File([".gvimrc.m4", ".tmux.conf.m4"])
for m4t in m4_templates:
    env.Command("${SOURCE.base}", m4t, "m4 $SOURCE > $TARGET")
