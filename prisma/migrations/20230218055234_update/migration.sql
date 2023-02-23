/*
  Warnings:

  - You are about to drop the `auth_group` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `auth_group_permissions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `auth_permission` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `auth_user` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `auth_user_groups` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `auth_user_user_permissions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `authtoken_token` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `django_admin_log` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `django_content_type` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `django_migrations` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `django_session` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `jisho_about` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `jisho_gyokuhentaizen` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `jisho_jiruisho` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `jisho_news` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `jisho_rakuyoshu` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `jisho_wakunnosiori` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `jisho_zozokutaizen` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "auth_group";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "auth_group_permissions";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "auth_permission";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "auth_user";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "auth_user_groups";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "auth_user_user_permissions";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "authtoken_token";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "django_admin_log";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "django_content_type";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "django_migrations";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "django_session";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "jisho_about";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "jisho_gyokuhentaizen";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "jisho_jiruisho";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "jisho_news";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "jisho_rakuyoshu";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "jisho_wakunnosiori";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "jisho_zozokutaizen";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "AuthGroup" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "AuthGroupPermissions" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "group_id" INTEGER NOT NULL,
    "permission_id" INTEGER NOT NULL,
    CONSTRAINT "AuthGroupPermissions_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "AuthPermission" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "AuthGroupPermissions_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "AuthGroup" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "AuthPermission" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "content_type_id" INTEGER NOT NULL,
    "codename" TEXT NOT NULL,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "AuthUser" (
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
CREATE TABLE "AuthUserGroups" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    CONSTRAINT "AuthUserGroups_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "AuthGroup" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "AuthUserGroups_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "AuthUser" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "AuthUserUserPermissions" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER NOT NULL,
    "permission_id" INTEGER NOT NULL,
    CONSTRAINT "AuthUserUserPermissions_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "AuthPermission" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "AuthUserUserPermissions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "AuthUser" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "AuthtokenToken" (
    "key" TEXT NOT NULL PRIMARY KEY,
    "created" DATETIME NOT NULL,
    "user_id" INTEGER NOT NULL,
    CONSTRAINT "AuthtokenToken_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "AuthUser" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "JishoAbout" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "creator" TEXT,
    "title" TEXT,
    "lang" TEXT,
    "content" TEXT,
    "pub_date" DATETIME,
    "about_type" TEXT
);

-- CreateTable
CREATE TABLE "JishoGyokuhentaizen" (
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
CREATE TABLE "JishoJiruisho" (
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
CREATE TABLE "JishoNews" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "pub_date" DATETIME,
    "title" TEXT,
    "content" TEXT
);

-- CreateTable
CREATE TABLE "JishoRakusyoshu" (
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
CREATE TABLE "JishoWakunnosiori" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "wks_id" TEXT NOT NULL,
    "deffination" TEXT,
    "entry" TEXT,
    "location" TEXT
);

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_auth_group_1" ON "AuthGroup"("name");
Pragma writable_schema=0;

-- CreateIndex
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "AuthGroupPermissions"("permission_id");

-- CreateIndex
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "AuthGroupPermissions"("group_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "AuthGroupPermissions"("group_id", "permission_id");

-- CreateIndex
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "AuthPermission"("content_type_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "AuthPermission"("content_type_id", "codename");

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_auth_user_1" ON "AuthUser"("username");
Pragma writable_schema=0;

-- CreateIndex
CREATE INDEX "auth_user_groups_group_id_97559544" ON "AuthUserGroups"("group_id");

-- CreateIndex
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "AuthUserGroups"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "AuthUserGroups"("user_id", "group_id");

-- CreateIndex
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "AuthUserUserPermissions"("permission_id");

-- CreateIndex
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "AuthUserUserPermissions"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "AuthUserUserPermissions"("user_id", "permission_id");

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_authtoken_token_2" ON "AuthtokenToken"("user_id");
Pragma writable_schema=0;
