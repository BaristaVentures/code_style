Null Android Styles
======================

# Table of Contents

* [Res folder](#res_folder)
	* [Strings](#strings)
	* [Views](#views)
* [Intellij IDEA (Android Studio) settings](#intellij_ide)
	* [Installation](#installation)
* [License](#license)
* [Inspiration](#inspiration)

<a name="res_folder"/>
# Res folder

Explain how `app/src/main/res` folder is managed.

<a name="strings"/>
## Strings

Every string should be grouped by `where`. 

1. Name (`<string name="id">`): every string id should:
  - `where`_`view_type`_`attribute`_`description`
  - `where`_`view_type`_`attribute`

1. Values (`<string name="">value</string>`): follow [google rules](https://www.google.com/design/spec/style/writing.html#))

1. Divide every group with a space and a comment (`<!-- Complete where -->`) :

*Example*:
```xml
    <!-- Phone Validation -->
    <string name="phone_button_verify">VERIFY</string>
    <string name="phone_button_continue">CONTINUE</string>

    <!-- Code Validation -->
    <string name="code_button_cancel">@android:string/cancel</string>
    <string name="code_button_verify">VERIFY CODE</string>
```

  - `Phone Validation` and `Code Validation` are `complete where`.
  - There should be a view `phone` and `code`.
  - There should be the buttons `verify` and `continue` for phone view and 
  `cancel` and `verify` for code view.

<a name="views"/>
## Views

1. Id (`android:id`): every view id should be composed by one of the next rules:
  - `where`_`view_type`_`attribute`_`description`
  - `where`_`view_type`_`attribute`

<a name="intellij_ide"/>
# Intellij IDEA (Android Studio) clean/autoformat settings

IntelliJ IDEA code style settings for Null Industries's Java and Android projects.

<a name="installation"/>
## Installation

1. Run the `install.sh` script.
1. Restart IntelliJ if it's running.
1. Open IntelliJ Project Settings -> Code Styles, change the code style for the
  project to the one you want.

<a name="license"/>
# License

[![Public domain](https://licensebuttons.net/p/zero/1.0/88x31.png)](https://creativecommons.org/publicdomain/zero/1.0/legalcode)

<a name="inspiration"/>
# Inspiration

- [Square code style](https://github.com/square/java-code-styles)
- [Google intellij java style guide](https://raw.githubusercontent.com/google/styleguide/gh-pages/intellij-java-google-style.xml)
- [Google markdown style guide](https://github.com/google/styleguide/blob/gh-pages/docguide/style.md)
- [Google writing style](https://www.google.com/design/spec/style/writing.html)