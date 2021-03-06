﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Security_Module.Models
{
    public class ResetPassword
    {
        [Required]
        [MaxLength(155)]
        [DataType(DataType.Password)]
        public string NewPassword { get; set; }

        [Required]
        [MaxLength(155)]
        [DataType(DataType.Password)]
        [Compare("NewPassword", ErrorMessage = "Does not Match")]
        public string ConfirmPassword { get; set; }
    }
}