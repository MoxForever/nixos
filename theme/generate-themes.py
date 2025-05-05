#!/usr/bin/env python3
import os

from constants import X_HEX_ACCENTS, X_RGB_ACCENTS, x_hex_colors, x_rgb_colors
from constants import Y_HEX_ACCENT1, Y_HEX_ACCENT2
from constants import y_hex_colors1, y_hex_colors2

def x_colorize_directory (path, variation):
    for accent in X_HEX_ACCENTS:
        os.system("find %s -name '*.*' -type f -exec sed -i 's/%s/%s/gI' {}  \\;" % (path, accent, x_hex_colors[variation]))
    for accent in X_RGB_ACCENTS:
        os.system("find %s -name '*.*' -type f -exec sed -i 's/%s/%s/gI' {}  \\;" % (path, accent, x_rgb_colors[variation]))

def y_colorize_directory (path, variation):
    for accent in Y_HEX_ACCENT1:
        os.system("find %s -name '*.*' -type f -exec sed -i 's/%s/%s/gI' {}  \\;" % (path, accent, y_hex_colors1[variation]))
    for accent in Y_HEX_ACCENT2:
        os.system("find %s -name '*.*' -type f -exec sed -i 's/%s/%s/gI' {}  \\;" % (path, accent, y_hex_colors2[variation]))

start_dir = os.getcwd()

os.system("mkdir -p usr/share/themes")

# Mint-Y #################################################################

curdir = os.getcwd()

# Mint-Y color variations
for color in y_hex_colors1.keys():
    for variant in ["", "-Dark"]:
        original_name = "Mint-Y%s" % variant
        path = os.path.join("src/Mint-Y/variations/%s" % color)
        if os.path.isdir(path):
            print("Derivating %s-%s" % (original_name, color))

            # Copy theme
            theme = "usr/share/themes/%s-%s" % (original_name, color)
            os.system("cp -R usr/share/themes/%s %s" % (original_name, theme))

            # Regenerate GTK4 sass
            os.system("cp -R src/Mint-Y/gtk-4.0/sass %s/gtk-4.0/" % theme)
            y_colorize_directory("%s/gtk-4.0/sass" % theme, color)
            os.chdir("%s/gtk-4.0" % theme)

            if (variant == "-Dark"):
                os.system("cp sass/gtk-dark.scss sass/gtk.scss")
                os.system("pysassc ./sass/gtk.scss gtk.css")
                # Add a gtk-dark.css (this is needed by libhandy/libadwaita apps when prefer-dark is on)
                os.system("pysassc ./sass/gtk-dark.scss gtk-dark.css")
            else:
                os.system("pysassc ./sass/gtk-dark.scss gtk-dark.css")
                os.system("pysassc ./sass/gtk.scss gtk.css")

            os.system("rm -rf sass .sass-cache")
            os.chdir(curdir)

            # Regenerate GTK3 sass
            os.system("cp -R src/Mint-Y/gtk-3.0/sass %s/gtk-3.0/" % theme)
            y_colorize_directory("%s/gtk-3.0/sass" % theme, color)
            os.chdir("%s/gtk-3.0" % theme)
            # os.system("sed -i 's/no-tint/tint/gI' ./sass/gtk.scss")
            # os.system("sed -i 's/no-tint/tint/gI' ./sass/gtk-dark.scss")
            if (variant == "-Dark"):
                os.system("cp sass/gtk-dark.scss sass/gtk.scss")
                os.system("pysassc ./sass/gtk.scss gtk.css")
                # Add a gtk-dark.css (this is needed by libhandy/libadwaita apps when prefer-dark is on)
                os.system("pysassc ./sass/gtk-dark.scss gtk-dark.css")
            else:
                os.system("pysassc ./sass/gtk-dark.scss gtk-dark.css")
                os.system("pysassc ./sass/gtk.scss gtk.css")

            os.system("rm -rf sass .sass-cache")
            os.chdir(curdir)

            # Regenerate Cinnamon sass
            os.system("cp -R src/Mint-Y/cinnamon/sass %s/cinnamon/" % theme)
            y_colorize_directory("%s/cinnamon/sass" % theme, color)
            os.chdir("%s/cinnamon" % theme)
            if (variant == "-Dark"):
                os.system("cp sass/cinnamon-dark.scss sass/cinnamon.scss")
            os.system("pysassc ./sass/cinnamon.scss cinnamon.css")
            os.system("rm -rf sass .sass-cache")
            os.chdir(curdir)

            # Accent color
            files = []
            files.append(os.path.join(theme, "gtk-2.0", "gtkrc"))
            files.append(os.path.join(theme, "gtk-2.0", "main.rc"))
            files.append(os.path.join(theme, "gtk-2.0", "panel.rc"))
            files.append(os.path.join(theme, "gtk-2.0", "apps.rc"))
            files.append(os.path.join(theme, "gtk-2.0", "menubar-toolbar.rc"))
            for file in files:
                if os.path.exists(file):
                    for accent in Y_HEX_ACCENT1:
                        os.system("sed -i s'/%(accent)s/%(color_accent)s/gI' %(file)s" % {'accent': accent, 'color_accent': y_hex_colors1[color], 'file': file})
                    for accent in Y_HEX_ACCENT2:
                        os.system("sed -i s'/%(accent)s/%(color_accent)s/gI' %(file)s" % {'accent': accent, 'color_accent': y_hex_colors2[color], 'file': file})

            # Remove metacity-theme-3.xml (it doesn't need to be derived since it's using GTK colors, and Cinnamon doesn't want to list it)
            os.system("rm -f %s" % os.path.join(theme, "metacity-1", "metacity-theme-3.xml"))

            directories = []
            directories.append(os.path.join(theme, "cinnamon/common-assets"))
            directories.append(os.path.join(theme, "cinnamon/light-assets"))
            directories.append(os.path.join(theme, "cinnamon/dark-assets"))
            for directory in directories:
                if os.path.exists(directory):
                    y_colorize_directory(directory, color)

            # Assets
            os.system("rm -rf %s/gtk-4.0/assets" % theme)
            os.system("rm -rf %s/gtk-3.0/assets" % theme)
            os.system("rm -rf %s/gtk-2.0/assets" % theme)
            if variant == "-Dark":
                os.system("cp -R %s/gtk-2.0/assets-dark %s/gtk-2.0/assets" % (path, theme))
                os.system("cp -R %s/xfwm4-dark/*.png %s/xfwm4/" % (path, theme))
            else:
                os.system("cp -R %s/gtk-2.0/assets %s/gtk-2.0/assets" % (path, theme))
                os.system("cp -R %s/xfwm4/*.png %s/xfwm4/" % (path, theme))
            os.system("cp -R %s/gtk-3.0/assets %s/gtk-3.0/assets" % (path, theme))
            os.system("cp -R %s/gtk-4.0/assets %s/gtk-4.0/assets" % (path, theme))


# Files
os.system("cp -R files/* ./")
