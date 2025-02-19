# Releases

## [1.7.4] - 30th January, 2022

1. **Bug Fix:** As per PR #6, fix TransactionData's currencyExchange type by [antoineraulin](https://github.com/antoineraulin).
2. Updates post PR #6 for stricter typing.
3. AmountData Model given missing `fromMap` method.

## [1.7.3] - 1st November, 2021

1. **BREAKING (HOTFIX):** `AccountMetaData.institutionIdentifier` -> `AccountMetaData.institutionID` with new map key `institution_id` instead of `institution_identifier` in Nordigen Accounts Endpoint v2 API.

2. CORS implementation for Flutter Web. Not sure if it fixes things yet.

## [1.7.2] - 31st October, 2021

- **BREAKING:** createRequisitionandBuildLink -> createRequisitionAndBuildLink camelCase fix.

## [1.7.1] - 31st October, 2021

1. Documentation fixes for Nordigen API v2.
2. Example fixes for Nordigen API v2.

## [1.7.0] - 31st October, 2021

1. **BREAKING:** Migrate to Nordigen API version 2. (Remain in version 1.5.5 or below to user API v1. Will be depreciated soon.)
   1. TOKEN -> BEARER
   2. Access Token -> User Secrets based authorization.
   3. Name conventions changed from \*ASPSP\* -> \*Institution\*.

2. Addition of new features, including: Accepting of End-User Agreements (PATCH /api/v2/agreements/enduser/{id}/accept/), updated Data Models.

3. Breakdown of the entire `NordigenAccountInfoAPI` class code into various parted modular extensions for better code readability.

4. Better tests.

## [1.5.5] - 13th October, 2021

1. Dev Dependency Migration: pedantic -> lints

2. Dependency update.

3. README changes and CONTRIBUTING guidelines added.

## [1.5.4] - 27th September, 2021

1. Completely removed dependency on Flutter and Flutter based packages

## [1.5.3] - 23rd August, 2021

1. ASPSP Logos are now parsed too from fetched data. Stored as `String` URL.

2. Dependency on Flutter removed. Truly a Dart/Flutter package now. Other dependencies updated.

## [1.5.2] - 17th August, 2021

1. Implemented `getEndUserAgreementsUsingUserID({required String endUserID})` functionality to fetch End User Agreements for user identified by a `endUserID`. Big thanks to [@c-louis](https://github.com/c-louis) for getting it done.

2. Changed the Response decode to decode UTF-8 body bytes to handle special ASCII characters. All thanks to [@stantemo](https://github.com/stantemo).

3. Documentation and Unit Tests update to reflect latest changes.

4. Changed the structure of Unit Tests to make them more readable.

## [1.5.0] - 13th June, 2021

1. Steps 5 and 6 of API Documentation working now.

2. Example widget improved.
Kudos to [Cashtic](https://cashtic.com) for running the necessary tests and implementing it!

## [1.3.3] - 20th May, 2021

Documentation fix

## [1.3.2] - 15th May, 2021

1. `AccountDataModel` rightfully changed to `AccountMetaData` so it makes more sense with respect to `BankAccountDetails`.

2. **BREAKING:** `BankAccountDetails` changed to `AccountDetails` for consistency.

3. **BUG FIX:** Changed key of End-User ID to `resourceId` for `AccountDetails.toMap()` to maintain consistency with Nordigen server resources.

4. `getAccountMetaData({required String accountID})` implemented.

## [1.3.1] - 15th May, 2021

Documentation fixes and more specific tests for DELETE requests.

## [1.3.0] - 15th May, 2021

1. Discrepencies solved with `BankAccountModel`; `Balance` and `getAccountBalances`.

2. Added basic GET and DELETE requests for certain endpoints.

3. **BREAKING:** Simplified certain APIs for more controlled usage.
   1. `fetchRedirectLinkForRequisition` method only takes `String aspspID` and `String requisitionID` now.
   2. `createEndUserAgreement` method only takes `String endUserID`,  `String aspspID`, `int maxHistoricalDays = 90` now.

4. PUT implementation added for future conveinience.

5. Updated documentation to highligh changes.

## [1.2.5] - 14th May, 2021

1. Implemented actual full `TransactionData` Model from API Documentation.

2. Renamed `BankAccountModel` to `AccountModel` because of Account schema discrepency in documentation between <https://nordigen.com/en/docs/account-information/overview/parameters-and-responses/> and <https://nordigen.com/en/docs/account-information/output/accounts/>.
3. Implemented `Balance` model from API Documentation.

4. Temporary `getAccountBalancesTemporary` method of `NordigenAccountInfoAPI` class implemented that will be depreciated once the returned data format can be pinned down.

5. Lint -> Pedantic.

6. Todo: Resolve account model discrepency between <https://nordigen.com/en/docs/account-information/output/accounts/> and Schema given in <https://nordigen.com/en/docs/account-information/overview/parameters-and-responses/>

## [1.2.0] - 14th May, 2021

1. ASPSP Data Structure changed to include  `[String] transaction_total_days`.

2. Lint rules applied.

3. Null Safety implemented.

4. Documentation follows null safety conventions now.

## [1.0.2] - 14th May, 2021

Initial release supporting [Nordigen's Account Information API documentation](https://nordigen.com/en/account_information_documenation/integration/quickstart_guide/) and relevant Data Models required to support it, in the form of Serializable Classes.

Added EU PSD2 AISP keywords to package descriptions so people can find it easier. Unnecessary Flutter dependancy removed.

## [1.0.1] - 13th May, 2021

Initial release supporting [Nordigen's Account Information API documentation](https://nordigen.com/en/account_information_documenation/integration/quickstart_guide/) and relevant Data Models required to support it, in the form of Serializable Classes.

Shortened Package description to follow dart conventions.

## [1.0.0] - 13th May, 2021

Initial release supporting [Nordigen's Account Information API documentation](https://nordigen.com/en/account_information_documenation/integration/quickstart_guide/) and relevant Data Models required to support it, in the form of Serializable Classes.
