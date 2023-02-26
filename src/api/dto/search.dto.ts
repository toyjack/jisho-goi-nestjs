import { IsOptional, IsString } from 'class-validator';

export class SearchGyokuhenDto {
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
