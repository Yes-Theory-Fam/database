# Database

This project contains an NPM package used for accessing the central database
of [YesBot](https://github.com/Yes-Theory-Fam/yesbot-ts)
and [YesTheory.Family](https://github.com/Yes-Theory-Fam/yestheory.family).

The package uses Prisma 2 as base and exports all generated code to make it available for use in the subprojects.

## Peer Dependencies

You are required to install two mandatory peerDependencies (dev) yourself:

```shell
yarn add -D prisma typegraphql-prisma
# or using npm
npm install --save-dev prisma typegraphql-prisma
```

If you also want to use the generated graphql code, you additionally need to install `type-graphql`.

## NPM Configuration

It's available through [GitHub Packages](https://github.com/features/packages) and can be installed using your favorite
package manager. Note that (since it's published through the GitHub Registry) it requires a few configuration steps to
install properly:

1. Create a Personal Access Token (Settings > Developer Settings > Personal Access Token) with the scope `read:packages`
   and make sure you have it saved somewhere.
2. Open (or create if it doesn't exist yet) `~/.npmrc` and add the following content:

```
@yes-theory-fam:registry=https://npm.pkg.github.com
//npm.pkg.github.com/:_authToken=TOKEN
```

replacing `TOKEN` with the Access Token obtained in step 1.

Once that is saved, you can install the package:

```shell
yarn add @yes-theory-fam/database
# or using npm
npm install --save @yes-theory-fam/database
```

## Package configuration

This package expects the environment variable `PRISMA_DATABASE_URL` to be set to a valid PostgreSQL connection string,
for example:

```
postgresql://username:password@localhost:5432/database?schema=public
```

The environment variable is required for the prisma commands `migrate` and `db pull`, etc. and for using the package to
access the database.

## Running prisma for this package

Since this package includes the schema, it is required to reference it with one of [prisma's schema location options](https://www.prisma.io/docs/concepts/components/prisma-schema#prisma-schema-file-location).

The recommended way of doing so is adding an entry in your project's package.json:

```json
"prisma": {
  "schema": "./node_modules/@yes-theory-fam/database/prisma/schema.prisma"
}
```

Alternatively you can provide the location on command invocation using the `--schema` flag:

```shell
yarn prisma --schema node_modules/@yes-theory-fam/database/prisma/schema.prisma
# or using npm
npm run prisma -- --schema node_modules/@yes-theory-fam/database/prisma/schema.prisma
```

It is advisable to create a script in your package.json as shorthand like `db:prisma` which allows you to also
create `db:generate` and `db:migrate` for generating the sources and migrating the database respectively.

## Using this package

Simply import `@yes-theory-fam/database` to get access to both everything generated to `@prisma/client` and all
exported `type-graphql` code. If you don't have type-graphql installed, you have to import
from `@yes-theory-fam/database/client` which only exports the Prisma client to avoid TypeScript errors.
