# Database

This project contains an NPM package used for accessing the central database
of [YesBot](https://github.com/Yes-Theory-Fam/yesbot-ts)
and [YesTheory.Family](https://github.com/Yes-Theory-Fam/yestheory.family).

The package uses Prisma 2 as base and exports all generated code to make it available for use in the subprojects.

You are required to install two mandatory peerDependencies (dev) yourself:

```shell
yarn add -D prisma typegraphql-prisma
# or using npm
npm install --save-dev prisma typegraphql-prisma
```

It's available through [GitHub Packages](https://github.com/features/packages) and can be installed using your favorite
package manager (if you want to install it for whatever reason):

```shell
yarn add @yestheory.family/database
# or using npm
npm install --save @yestheory.family/database
```

This package expects the environment variable `PRISMA_DATABASE_URL` to be set to a valid PostgreSQL connection string,
for example:

```
postgresql://username:password@localhost:5432/database?schema=public
```

The environment variable is required for the prisma commands `migrate` and `db pull`, etc.

## Running prisma for this package

Since the package includes the schema, it is required to reference it with prisma's schema option:

```shell
yarn prisma --schema node_modules/@yes-theory-fam/database/prisma/prisma.schema
# or using npm
npm run prisma --schema node_modules/@yes-theory-fam/database/prisma/prisma.schema
```

It is advisable to create a script in your package.json as shorthand like `db:prisma` which allows you to also
create `db:generate` and `db:migrate` for generating the sources and migrating the database respectively. 
