using System;
using System.Collections.Generic;
using System.Globalization;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using SawaTech.PropertyMini.AuthResponses;
using Volo.Abp.Application.Dtos;
using Volo.Abp.Application.Services;

namespace SawaTech.PropertyMini.Properties;

public interface IPropertyAppService: IApplicationService
{
    Task<GeneralResponse> GetListAsync(PropertyFilterDto? filterDto =null, string? sortBy=null, bool sortDescending=false,int? maxResults=10);
    Task<GeneralResponse> GetAsync(Guid id);
    Task<GeneralResponse> CreateAsync(CreateUpdatePropertyDto input);
    Task<GeneralResponse> UpdateAsync(Guid id, CreateUpdatePropertyDto input);
    Task<GeneralResponse> DeleteAsync(Guid id);
}
