import { IsOptional, IsString } from 'class-validator';

export class SearchJiruishoDto {
  @IsString()
  @IsOptional()
  entry?: string;

  @IsString()
  @IsOptional()
  entry_expression?: string;
  @IsString()
  @IsOptional()
  shouten?: string;
  @IsString()
  @IsOptional()
  hen?: string;
  @IsString()
  @IsOptional()
  bu?: string;
  @IsString()
  @IsOptional()
  maeda_loc?: string;
  @IsString()
  @IsOptional()
  maeda_ndl_url?: string;
  @IsString()
  @IsOptional()
  kurokawa_loc?: string;
  @IsString()
  @IsOptional()
  kurokawa_ndl_url?: string;
  @IsString()
  @IsOptional()
  onkun?: string;
  @IsString()
  @IsOptional()
  char_count?: string;
  @IsString()
  @IsOptional()
  gokei_display?: string;
  @IsString()
  @IsOptional()
  gokei_search_original?: string;
  @IsString()
  @IsOptional()
  gokei_search_current?: string;
  @IsString()
  @IsOptional()
  defination?: string;
  @IsString()
  @IsOptional()
  remark?: string;
}
