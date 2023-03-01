import { Controller, Get, Param, Query } from '@nestjs/common';
import { JiruishoService } from '../services';
import { SearchJiruishoDto } from '../dto';

@Controller('api/jiruisho')
export class JiruishoController {
  constructor(private readonly jiruishoService: JiruishoService) {}

  @Get('search')
  search(@Query() query: SearchJiruishoDto) {
    return this.jiruishoService.search(query);
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.jiruishoService.findOne(id);
  }
}
