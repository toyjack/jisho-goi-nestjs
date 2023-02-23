/*
  Warnings:

  - You are about to drop the `AuthGroup` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `AuthGroupPermissions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `AuthPermission` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `AuthUser` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `AuthUserGroups` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `AuthUserUserPermissions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `AuthtokenToken` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `JishoAbout` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `JishoGyokuhentaizen` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `JishoJiruisho` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `JishoNews` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `JishoRakusyoshu` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `JishoWakunnosiori` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "AuthGroup";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "AuthGroupPermissions";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "AuthPermission";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "AuthUser";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "AuthUserGroups";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "AuthUserUserPermissions";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "AuthtokenToken";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "JishoAbout";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "JishoGyokuhentaizen";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "JishoJiruisho";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "JishoNews";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "JishoRakusyoshu";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "JishoWakunnosiori";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "password" TEXT NOT NULL,
    "last_login" DATETIME,
    "is_superuser" bool NOT NULL,
    "username" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "is_staff" bool NOT NULL,
    "is_active" bool NOT NULL,
    "date_joined" DATETIME NOT NULL,
    "first_name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "UserGroup" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    CONSTRAINT "UserGroup_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "Token" (
    "key" TEXT NOT NULL PRIMARY KEY,
    "created" DATETIME NOT NULL,
    "user_id" INTEGER NOT NULL,
    CONSTRAINT "Token_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "About" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "creator" TEXT,
    "title" TEXT,
    "lang" TEXT,
    "content" TEXT,
    "pub_date" DATETIME,
    "about_type" TEXT
);

-- CreateTable
CREATE TABLE "Gyokuhentaizen" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "ghtz_id" TEXT NOT NULL,
    "entry" TEXT,
    "jion_r" TEXT,
    "jion_l" TEXT,
    "wakun" TEXT,
    "ids" TEXT,
    "radical" TEXT,
    "remain_strokes" TEXT
);

-- CreateTable
CREATE TABLE "Jiruisho" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "entry" TEXT NOT NULL,
    "variants_A" TEXT,
    "variants_A_no" TEXT,
    "variants_B" TEXT,
    "variants_B_no" TEXT,
    "variants_C" TEXT,
    "variants_C_no" TEXT,
    "shoten" TEXT,
    "hen" TEXT NOT NULL,
    "bu" TEXT NOT NULL,
    "loc_maeda" TEXT NOT NULL,
    "loc_kurokawa" TEXT NOT NULL,
    "no_in_block" TEXT NOT NULL,
    "total_in_block" TEXT NOT NULL,
    "tsuban" TEXT,
    "bubetsu_tsuban" TEXT,
    "henbetsububesu_onkunban" TEXT,
    "on_kun" TEXT,
    "onkunbetsu_tsuban" TEXT,
    "entry_length" TEXT,
    "on" TEXT,
    "on_matched" TEXT,
    "on_modern" TEXT,
    "kun" TEXT,
    "kun_matched" TEXT,
    "kun_modern" TEXT,
    "defination" TEXT,
    "remark" TEXT,
    "remark2" TEXT
);

-- CreateTable
CREATE TABLE "News" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "pub_date" DATETIME,
    "title" TEXT,
    "content" TEXT
);

-- CreateTable
CREATE TABLE "Rakusyoshu" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "record_creator" TEXT,
    "check_kubo" TEXT,
    "check_fujimoto" TEXT,
    "page" TEXT,
    "line" TEXT,
    "gallica" TEXT,
    "initial_on" TEXT,
    "entry" TEXT,
    "kanji_pair" TEXT,
    "ruby_left_first" TEXT,
    "ruby_left_remains" TEXT,
    "ruby_right_first" TEXT,
    "ruby_right_remains" TEXT,
    "remark" TEXT,
    "nikkoku1_entry" TEXT,
    "nikkoku1_url" TEXT,
    "nikkoku2_entry" TEXT,
    "nikkoku2_url" TEXT,
    "nikkoku3_entry" TEXT,
    "nikkoku3_url" TEXT,
    "nikkoku4_entry" TEXT,
    "nikkoku4_url" TEXT,
    "nikkoku5_entry" TEXT,
    "nikkoku5_url" TEXT,
    "nikkoku6_entry" TEXT,
    "nikkoku6_url" TEXT,
    "nikkoku7_entry" TEXT,
    "nikkoku7_url" TEXT,
    "group_entry" TEXT
);

-- CreateTable
CREATE TABLE "Wakunnosiori" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "wks_id" TEXT NOT NULL,
    "deffination" TEXT,
    "entry" TEXT,
    "location" TEXT
);

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_auth_user_1" ON "User"("username");
Pragma writable_schema=0;

-- CreateIndex
CREATE INDEX "auth_user_groups_group_id_97559544" ON "UserGroup"("group_id");

-- CreateIndex
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "UserGroup"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "UserGroup"("user_id", "group_id");

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_authtoken_token_2" ON "Token"("user_id");
Pragma writable_schema=0;
