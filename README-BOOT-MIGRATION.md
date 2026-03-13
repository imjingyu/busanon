# BusanOn -> Spring Boot migration

## What changed
- Eclipse / STS metadata removed so the project can be opened directly as a Maven project in IntelliJ.
- Legacy Spring MVC XML bootstrapping (`web.xml`, `root-context.xml`, `servlet-context.xml`) was replaced with Spring Boot Java configuration.
- Added `BusanOnApplication` as the Spring Boot entry point.
- Converted database, mail, JSP, and upload-path settings to `src/main/resources/application.properties`.
- Replaced hard-coded Windows upload paths with configurable properties.
- Kept existing JSP / controller / service / DAO / MyBatis structure as much as possible.

## How to run in IntelliJ
1. Open the `BusanOn-springboot` folder in IntelliJ.
2. Let IntelliJ import the Maven project.
3. Set Project SDK to Java 17.
4. Edit `src/main/resources/application.properties` with your DB / mail settings.
5. Run `BusanOnApplication`.

## Notes
- This is a best-effort migration of the base framework and project structure.
- Some legacy code, SQL mappers, JSP paths, or external API integrations may still need manual fixes after the first boot.
- Original secret values were removed from config. Re-enter your own values locally.
