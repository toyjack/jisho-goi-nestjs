import { Controller, Get, Param, Query } from '@nestjs/common';
import { GyokuhentaizenService } from '../services';
import { SearchGyokuhenDto } from '../dto';

@Controller('api/gyokuhentaizen')
export class GyokuhentaizenController {
  constructor(private readonly gyokuhentaizenService: GyokuhentaizenService) {}

  @Get('search')
  search(@Query() query: SearchGyokuhenDto) {
    return this.gyokuhentaizenService.search(query);
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.gyokuhentaizenService.findOne(id);
  }
}
