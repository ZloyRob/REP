//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class jSkillList
{
    public int SkillListId { get; set; }
    public int SkillId { get; set; }
    public string PersonId { get; set; }

    public virtual hSkill hSkill { get; set; }
    public virtual AspNetUsers AspNetUsers { get; set; }
}
