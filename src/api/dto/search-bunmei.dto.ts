import { IsOptional, IsString } from 'class-validator';

export class SearchBunmeiDto {
  @IsString()
  @IsOptional()
  entry?: string;

  @IsString()
  @IsOptional()
  gokei?: string;

  @IsString()
  @IsOptional()
  shouten?: string;

  @IsString()
  @IsOptional()
  leftWakun?: string;

  @IsString()
  @IsOptional()
  def?: string;

  @IsString()
  @IsOptional()
  gotou?: string;

  // entryOriginal?: string;

  // gokeiOriginal?: string;

  @IsString()
  @IsOptional()
  itemType?: string;

  @IsString()
  @IsOptional()
  bu?: string;

  @IsString()
  @IsOptional()
  mon?: string;

  @IsString()
  @IsOptional()
  page?: string;

  @IsString()
  @IsOptional()
  line?: string;
}
