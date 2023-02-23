import { IsOptional, IsString } from 'class-validator';

export class SearchDto {
  @IsString()
  database: string;

  @IsString()
  @IsOptional()
  id?: string;

  @IsString()
  @IsOptional()
  entry?: string;

  @IsString()
  @IsOptional()
  jion?: string;

  @IsString()
  @IsOptional()
  wakun?: string;

  @IsString()
  @IsOptional()
  radical?: string;

  @IsString()
  @IsOptional()
  remain_strokes?: string;
}
