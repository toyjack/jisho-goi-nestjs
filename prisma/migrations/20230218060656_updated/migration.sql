/*
  Warnings:

  - You are about to drop the `UserGroup` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropIndex
DROP INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq";

-- DropIndex
DROP INDEX "auth_user_groups_user_id_6a12ed8b";

-- DropIndex
DROP INDEX "auth_user_groups_group_id_97559544";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "UserGroup";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "last_name" TEXT,
    "first_name" TEXT,
    "last_login" DATETIME,
    "date_joined" DATETIME NOT NULL,
    "is_superuser" bool NOT NULL,
    "is_staff" bool NOT NULL,
    "is_active" bool NOT NULL
);
INSERT INTO "new_User" ("date_joined", "email", "first_name", "id", "is_active", "is_staff", "is_superuser", "last_login", "last_name", "password", "username") SELECT "date_joined", "email", "first_name", "id", "is_active", "is_staff", "is_superuser", "last_login", "last_name", "password", "username" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_auth_user_1" ON "User"("username");
Pragma writable_schema=0;
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
