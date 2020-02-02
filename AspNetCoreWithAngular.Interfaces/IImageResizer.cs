using System;
using System.Collections.Generic;
using System.Text;

namespace AspNetCoreWithAngular.Interfaces
{
    public interface IImageResizer
    {
        bool Resize(string source, string target);
    }
}
