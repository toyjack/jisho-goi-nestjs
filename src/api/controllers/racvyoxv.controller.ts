import { Controller, Get, Param, Query } from '@nestjs/common';
import { RacyvoxvService } from '../services';
import { SearchRacvyoxvDto } from '../dto';

@Controller('api/racvyoxv')
export class RacvyoxvController {
  constructor(private readonly racvyoxvService: RacyvoxvService) {}

  @Get('search')
  search(@Query() query: SearchRacvyoxvDto) {
    return this.racvyoxvService.search(query);
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.racvyoxvService.findOne(id);
  }
}
