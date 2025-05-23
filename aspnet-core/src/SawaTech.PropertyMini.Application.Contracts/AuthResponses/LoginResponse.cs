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
        string TokenType,
        string UserName,
        string Email,
        string[] Roles,
         string AccessToken = null!,
        string RefreshToken = null,
        string Message =null!
    );
}
