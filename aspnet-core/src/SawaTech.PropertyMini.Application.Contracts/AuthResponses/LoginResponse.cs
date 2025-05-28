using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SawaTech.PropertyMini.AuthResponses
{
    public record LoginResponse(
       bool Flag,

      //DateTime ExpiresIn,
      Payload? UserData,
         //string[] Roles,
         string AccessToken = null!,
        string RefreshToken = null!,
        string Message = null!

    );

    public record Payload
    (string? UserType,
        string? UserName,
        string Email,
        Guid Id
        );
}
