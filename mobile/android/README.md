Barista Android Styles
======================

# Table of Contents

* [Bug Report](bug_report.md)
* [Development Flow](dev-flow.md)
* [Changelog](changelog.md)
* [Development Flow](dev-flow.md)
* [Android Studio settings](#android_studio)
* [Git Ignore](#gitignore)
* [File Names](#file_names)
* [Res folder](#res_folder)
	* [Layouts](#layouts)
* [Bug Report](bug_report.md)
* [License](#license)
* [Inspiration](#inspiration)

<a name="android_studio"/>
# Android Studio clean/autoformat settings

IntelliJ IDEA code style settings for Null Industries's Java and Android projects. 
Setup files and [install help](android_studio_settings/README.md) are in `android_studio_settings/`.

<a name="gitignore"/>
# Gitignore

Put [.gitignore](.gitignore) file on root for every project.

<a name="file_names"/>
# File Names

Class names are written in [UpperCamelCase](http://en.wikipedia.org/wiki/CamelCase). 

For classes that extend an Android component, the name of the class should end with the name of the component; for example: `SignInActivity`, `SignInFragment`, `ImageUploaderService`, `ChangePasswordDialog`.

<a name="res_folder"/>
# Res folder

Explain how `app/src/main/res` folder is managed.

1. Every resource/id/string_name should be in __lowercase_underscore__.
1. 

<a name="layouts"/>
## Layouts

Layout files should match the name of the Android components that they are intended for but moving the top level component name to the beginning. For example, if we are creating a layout for the `SignInActivity`, the name of the layout file should be `sign_in_activity.xml`.

|     Component    |       Class Name       |          Layout Name         |
|:----------------:|:----------------------:|:----------------------------:|
| Activity         | `UserProfileActivity`  | `user_profile_activity.xml`  |
| Fragment         | `SignUpFragment`       | `sign_up_fragment.xml`       |
| Dialog           | `ChangePasswordDialog` | `change_password_dialog.xml` |
| AdapterView item | ---                    | `person_item.xml`            |
| Partial layout   | ---                    | `stats_bar_partial.xml`      |

<a name="strings"/>

## Values

Resource files in the values folder should be *plural*, e.g. `strings.xml`, `styles.xml`, `colors.xml`, `dimens.xml`, `attrs.xml`

<a name="license"/>
# License

[![Public domain](https://licensebuttons.net/p/zero/1.0/88x31.png)](https://creativecommons.org/publicdomain/zero/1.0/legalcode)

<a name="inspiration"/>
# Inspiration

- [Square code style](https://github.com/square/java-code-styles)
- [Google Android Source code style](https://source.android.com/source/code-style.html)
- [Google intellij java style guide](https://raw.githubusercontent.com/google/styleguide/gh-pages/intellij-java-google-style.xml)
- [Google markdown style guide](https://github.com/google/styleguide/blob/gh-pages/docguide/style.md)
- [Google writing style](https://www.google.com/design/spec/style/writing.html)
- [Ribot android guide line](https://github.com/ribot/android-guidelines/edit/master/project_and_code_guidelines.md)
