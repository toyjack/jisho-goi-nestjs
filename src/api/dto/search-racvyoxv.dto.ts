import { IsOptional, IsString } from 'class-validator';

export class SearchRacvyoxvDto {
  @IsString()
  @IsOptional()
  term?: string;

  @IsString()
  @IsOptional()
  kanji_pair_length?: string;

  @IsString()
  @IsOptional()
  page?: string;

  @IsString()
  @IsOptional()
  line?: string;

  @IsString()
  @IsOptional()
  initial_on?: string;

  @IsString()
  @IsOptional()
  entry?: string;

  @IsString()
  @IsOptional()
  kanji_pair?: string;

  @IsString()
  @IsOptional()
  ruby?: string;

  @IsString()
  @IsOptional()
  remark?: string;

  @IsString()
  @IsOptional()
  group_entry?: string;
}
