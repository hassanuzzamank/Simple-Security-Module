﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Security_Module.Models
{
    public class Role
    {
        [Key]
        public int RoleId { get; set; }
        [MaxLength(100)]
        [Display(Name = "Role Name")]
        public string RoleName { get; set; }
    }
}