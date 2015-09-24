Null Android Styles
======================

# Table of Contents

* [File Names](#file_names)
* [Res folder](#res_folder)
	* [Layouts](#layouts)
	* [Strings](#strings)
	* [Views](#views)
* [Intellij IDEA (Android Studio) settings](#intellij_ide)
	* [Installation](#installation)
* [License](#license)
* [Inspiration](#inspiration)

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

Layout files should match the name of the Android components that they are intended for but moving the top level component name to the beginning. For example, if we are creating a layout for the `SignInActivity`, the name of the layout file should be `activity_sign_in.xml`.

|     Component    |       Class Name       |          Layout Name         |
|:----------------:|:----------------------:|:----------------------------:|
| Activity         | `UserProfileActivity`  | `activity_user_profile.xml`  |
| Fragment         | `SignUpFragment`       | `fragment_sign_up.xml`       |
| Dialog           | `ChangePasswordDialog` | `dialog_change_password.xml` |
| AdapterView item | ---                    | `item_person.xml`            |
| Partial layout   | ---                    | `partial_stats_bar.xml`      |

<a name="strings"/>
## Strings

1. Name (`<string name="____">`): every string id should:
  - `where` _ `view_type` _ `content_type` _ `description`
  - `where` _ `view_type` _ `description`

|             Component            |         Class         |  Where  | View Type |          Content Type         |   Description   |                             Name                            |
|:--------------------------------:|:---------------------:|:-------:|:---------:|:-----------------------------:|:---------------:|:-----------------------------------------------------------:|
| Button "cancel"                  | LoginActivity         | login   | button    | -                             | cancel          | login_button_cancel                                         |
| Progress dialog "loading orders" | OrdersActivity        | orders  | progress  | -                             | loading         | orders_progress_loading                                     |
| Label "total actions"            | ActionsActivity       | actions | label     | -                             | total           | actions_label_total                                         |
| Label "total heroes"             | TipActivity           | tip     | label     | -                             | total_heroes    | tip_label_total_heroes                                      |
| Label "total orders"             | TipActivity           | tip     | label     | -                             | total_orders    | tip_label_total_orders                                      |
| Dialog "Supported Weight"        | AddressPickerActivity | address | dialog    | weight_title / weight_message | title / message | address_dialog_weight_title / address_dialog_weight_message |

1. Values (`<string name="">______</string>`): follow [google rules](https://www.google.com/design/spec/style/writing.html#))

1. Divide every group with a space and a comment (`<!-- Class and maybe a 3/4 words description -->`) :

*Example*:
```xml
    <!-- Phone Validation -->
    <string name="phone_button_verify">VERIFY</string>
    <string name="phone_button_continue">CONTINUE</string>

    <!-- Code Validation -->
    <string name="code_button_cancel">@android:string/cancel</string>
    <string name="code_button_verify">VERIFY CODE</string>
```

<a name="views"/>
## Views

1. Id (`android:id`): every view id should be composed by one of the next rules:
  - `where` _ `view_type` _ `content_type` _ `description`
  - `where` _ `view_type` _ `description`

|             Component            |         Class         |  Where  | View Type |          Content Type         |   Description   |                             Id                            |
|:--------------------------------:|:---------------------:|:-------:|:---------:|:-----------------------------:|:---------------:|:-----------------------------------------------------------:|
| Button "cancel"                  | LoginActivity         | login   | button    | -                             | cancel          | login_button_cancel                                         |
| Progress dialog "loading orders" | OrdersActivity        | orders  | progress  | -                             | loading         | orders_progress_loading                                     |
| Label "total actions"            | ActionsActivity       | actions | label     | -                             | total           | actions_label_total                                         |
| Label "total heroes"             | TipActivity           | tip     | label     | -                             | total_heroes    | tip_label_total_heroes                                      |
| Label "total orders"             | TipActivity           | tip     | label     | -                             | total_orders    | tip_label_total_orders                                      |
| Dialog "Supported Weight"        | AddressPickerActivity | address | dialog    | weight_title / weight_message | title / message | address_dialog_weight_title / address_dialog_weight_message |

## Values

Resource files in the values folder should be *plural*, e.g. `strings.xml`, `styles.xml`, `colors.xml`, `dimens.xml`, `attrs.xml`

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
- [Google Android Source code style](https://source.android.com/source/code-style.html)
- [Google intellij java style guide](https://raw.githubusercontent.com/google/styleguide/gh-pages/intellij-java-google-style.xml)
- [Google markdown style guide](https://github.com/google/styleguide/blob/gh-pages/docguide/style.md)
- [Google writing style](https://www.google.com/design/spec/style/writing.html)
- [Ribot android guide line](https://github.com/ribot/android-guidelines/edit/master/project_and_code_guidelines.md)