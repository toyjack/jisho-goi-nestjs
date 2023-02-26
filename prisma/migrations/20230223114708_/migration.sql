/*
  Warnings:

  - A unique constraint covering the columns `[ghtz_id]` on the table `Gyokuhentaizen` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Gyokuhentaizen_ghtz_id_key" ON "Gyokuhentaizen"("ghtz_id");
