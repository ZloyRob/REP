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
using System.ComponentModel.DataAnnotations;

public partial class jWorkList
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public jWorkList()
    {
        this.jJournal = new HashSet<jJournal>();
    }

    public int WorkListId { get; set; }
    [DataType(DataType.Date)]
    [DisplayFormat(DataFormatString =
"{0:yyyy-MM-dd}",
ApplyFormatInEditMode = true)]
    public Nullable<System.DateTime> DateIn { get; set; }
    [DataType(DataType.Date)]
    [DisplayFormat(DataFormatString =
"{0:yyyy-MM-dd}",
ApplyFormatInEditMode = true)]
    public Nullable<System.DateTime> DateOut { get; set; }
    public System.DateTime DateModifcation { get; set; }
    [DataType(DataType.Date)]
    [DisplayFormat(DataFormatString =
"{0:yyyy-MM-dd}",
ApplyFormatInEditMode = true)]
    public System.DateTime Deadline { get; set; }
    public int QueryId { get; set; }
    public int WorkTypeId { get; set; }
    public string PersonExecId { get; set; }
    public int StateWorkId { get; set; }
    public bool Verification { get; set; }

    public virtual AspNetUsers AspNetUsers { get; set; }
    public virtual hStateWork hStateWork { get; set; }
    public virtual hWorkType hWorkType { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<jJournal> jJournal { get; set; }
    public virtual jQuery jQuery { get; set; }
}
