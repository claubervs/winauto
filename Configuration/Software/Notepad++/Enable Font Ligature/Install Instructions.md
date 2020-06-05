
# Install Instructions

It won't currently work "out of the box". The text rendering needs tweaked but you can do it with a plugin. Keep in mind support for ligatures is not officially supported so you might run into issues.

This is the easiest way I know (without recompiling) to get ligatures to work in Notepad++:



1. Install a recent version of Fira Code (use either the normal font or the retina as those are the only ones that seem to work).
2. Install LuaScript via the Plugin Manager (you can also use PythonScript if you are more comfortable with it or want to use a 10 ton hammer).
3. Select the font via `Settings > Style Configurator > Global Styles > Global Override`. Select "Fira Code" for the font style and turn on `Enable global font`
4. Edit the LuaScript startup file by doing `Plugins > LuaScript > Edit Startup Script` and add the following code:

    	editor1.Technology = SC_TECHNOLOGY_DIRECTWRITE
    	editor2.Technology = SC_TECHNOLOGY_DIRECTWRITE

Restart and enjoy.