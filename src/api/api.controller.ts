import { Controller, Get, Param, Query } from '@nestjs/common';
import { ApiService } from './api.service';
import { SearchBunmeiDto, SearchGyokuhenDto, SearchJiruishoDto } from './dto';

@Controller('api')
export class ApiController {
  constructor(private readonly apiService: ApiService) {}

  @Get('/gyokuhentaizen/search')
  search(@Query() query: SearchGyokuhenDto) {
    return this.apiService.searchGyokuhen(query);
  }
  @Get('/gyokuhentaizen/:id')
  findOne(@Param('id') id: string) {
    return this.apiService.gyokuhenFindOne(id);
  }

  @Get('/jiruisho/search')
  searchJiruisho(@Query() query: SearchJiruishoDto) {
    return this.apiService.searchJiruisho(query);
  }

  @Get('/jiruisho/:id')
  findOneJiruisho(@Param('id') id: string) {
    return this.apiService.jiruishoFindOne(Number(id));
  }

  @Get('/bunmei/search')
  searchBunmei(@Query() query: SearchBunmeiDto) {
    return this.apiService.searchBunmei(query);
  }

  @Get('/bunmei/:id')
  findOneBunmei(@Param('id') id: string) {
    return this.apiService.bunmeiFindOne(id);
  }
}
