/*
  Warnings:

  - You are about to alter the column `is_active` on the `User` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `is_staff` on the `User` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.
  - You are about to alter the column `is_superuser` on the `User` table. The data in that column could be lost. The data in that column will be cast from `Unsupported("bool")` to `Boolean`.

*/
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
    "is_superuser" BOOLEAN NOT NULL,
    "is_staff" BOOLEAN NOT NULL,
    "is_active" BOOLEAN NOT NULL
);
INSERT INTO "new_User" ("date_joined", "email", "first_name", "id", "is_active", "is_staff", "is_superuser", "last_login", "last_name", "password", "username") SELECT "date_joined", "email", "first_name", "id", "is_active", "is_staff", "is_superuser", "last_login", "last_name", "password", "username" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
