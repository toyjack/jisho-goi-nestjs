import { IsOptional, IsString } from 'class-validator';

export class SearchWakunnosioriDto {
  @IsString()
  @IsOptional()
  entry?: string;

  @IsString()
  @IsOptional()
  defination?: string;
}
