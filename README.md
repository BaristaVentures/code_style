# code_style
Code styles, and tools for different languages

# General conventions

- Mobile Clients should always send the next headers for every request with our api: 

  * `bv-app-version`: `platform/typeApp/version/build` _where_:
  
    - `platform` : platform who make the request in lower case (ej: ios, android)
    - `typeApp` : app profile who make the request in lower case (ej: customer, driver, admin) if there are only one app could be mobile for mobile apps
    - `version` : current app version following semver standard (x.y.z)
    - `build` : current build version, could be empty, number or letters
