/*
  Warnings:

  - A unique constraint covering the columns `[moviesId]` on the table `Screening` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `moviesId` to the `Screening` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Screening" ADD COLUMN     "moviesId" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Screening_moviesId_key" ON "Screening"("moviesId");

-- AddForeignKey
ALTER TABLE "Screening" ADD CONSTRAINT "Screening_moviesId_fkey" FOREIGN KEY ("moviesId") REFERENCES "Movies"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
