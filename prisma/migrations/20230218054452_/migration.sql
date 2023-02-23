-- CreateTable
CREATE TABLE "auth_group" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "auth_group_permissions" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "group_id" INTEGER NOT NULL,
    "permission_id" INTEGER NOT NULL,
    CONSTRAINT "auth_group_permissions_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "auth_group_permissions_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "auth_permission" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "content_type_id" INTEGER NOT NULL,
    "codename" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    CONSTRAINT "auth_permission_content_type_id_fkey" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "auth_user" (
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
CREATE TABLE "auth_user_groups" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER NOT NULL,
    "group_id" INTEGER NOT NULL,
    CONSTRAINT "auth_user_groups_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "auth_user_groups_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "auth_user_user_permissions" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER NOT NULL,
    "permission_id" INTEGER NOT NULL,
    CONSTRAINT "auth_user_user_permissions_permission_id_fkey" FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "auth_user_user_permissions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "authtoken_token" (
    "key" TEXT NOT NULL PRIMARY KEY,
    "created" DATETIME NOT NULL,
    "user_id" INTEGER NOT NULL,
    CONSTRAINT "authtoken_token_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "django_admin_log" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "action_time" DATETIME NOT NULL,
    "object_id" TEXT,
    "object_repr" TEXT NOT NULL,
    "change_message" TEXT NOT NULL,
    "content_type_id" INTEGER,
    "user_id" INTEGER NOT NULL,
    "action_flag" smallint unsigned NOT NULL,
    CONSTRAINT "django_admin_log_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT "django_admin_log_content_type_id_fkey" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- CreateTable
CREATE TABLE "django_content_type" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "app_label" TEXT NOT NULL,
    "model" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "django_migrations" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "app" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "applied" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "django_session" (
    "session_key" TEXT NOT NULL PRIMARY KEY,
    "session_data" TEXT NOT NULL,
    "expire_date" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "jisho_about" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "creator" TEXT,
    "title" TEXT,
    "lang" TEXT,
    "content" TEXT,
    "pub_date" DATETIME,
    "about_type" TEXT
);

-- CreateTable
CREATE TABLE "jisho_gyokuhentaizen" (
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
CREATE TABLE "jisho_jiruisho" (
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
CREATE TABLE "jisho_news" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "pub_date" DATETIME,
    "title" TEXT,
    "content" TEXT
);

-- CreateTable
CREATE TABLE "jisho_rakuyoshu" (
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
CREATE TABLE "jisho_wakunnosiori" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "wks_id" TEXT NOT NULL,
    "deffination" TEXT,
    "entry" TEXT,
    "location" TEXT
);

-- CreateTable
CREATE TABLE "jisho_zozokutaizen" (
    "zztz_id" TEXT NOT NULL PRIMARY KEY,
    "page" TEXT,
    "line" TEXT,
    "no" TEXT,
    "glyph" TEXT,
    "wakun_list" TEXT,
    "jion_list" TEXT
);

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_auth_group_1" ON "auth_group"("name");
Pragma writable_schema=0;

-- CreateIndex
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions"("permission_id");

-- CreateIndex
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions"("group_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions"("group_id", "permission_id");

-- CreateIndex
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission"("content_type_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission"("content_type_id", "codename");

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_auth_user_1" ON "auth_user"("username");
Pragma writable_schema=0;

-- CreateIndex
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups"("group_id");

-- CreateIndex
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups"("user_id", "group_id");

-- CreateIndex
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions"("permission_id");

-- CreateIndex
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions"("user_id", "permission_id");

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_authtoken_token_2" ON "authtoken_token"("user_id");
Pragma writable_schema=0;

-- CreateIndex
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log"("user_id");

-- CreateIndex
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log"("content_type_id");

-- CreateIndex
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type"("app_label", "model");

-- CreateIndex
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session"("expire_date");
