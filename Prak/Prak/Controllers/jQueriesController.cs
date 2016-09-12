﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Prak.Models;

namespace Prak.Controllers
{
    public class jQueriesController : Controller
    {
        private KOMK_Main_v2Entities db = new KOMK_Main_v2Entities();

        // GET: jQueries
        public ActionResult Index()
        {
            var jQuery = db.jQuery.Include(j => j.hPerson).Include(j => j.hPerson1).Include(j => j.hState);
            return View(jQuery.ToList());
        }

        // GET: jQueries/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            jQuery jQuery = db.jQuery.Find(id);
            if (jQuery == null)
            {
                return HttpNotFound();
            }
            return View(jQuery);
        }

        // GET: jQueries/Create
        public ActionResult Create()
        {
            ViewBag.PersonId = new SelectList(db.hPerson, "PersonId", "FIO");
            ViewBag.PersonSpId = new SelectList(db.hPerson, "PersonId", "FIO");
            ViewBag.StateId = new SelectList(db.hState, "StateId", "Description");
            return View();
        }

        // POST: jQueries/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "GroupQueryId,QueryId,DateOut,DateIn,DateModification,DeadLine,Text,StateId,PersonId,PersonSpId,Relevance")] jQuery jQuery)
        {
            if (ModelState.IsValid)
            {
                db.jQuery.Add(jQuery);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PersonId = new SelectList(db.hPerson, "PersonId", "FIO", jQuery.PersonId);
            ViewBag.PersonSpId = new SelectList(db.hPerson, "PersonId", "FIO", jQuery.PersonSpId);
            ViewBag.StateId = new SelectList(db.hState, "StateId", "Description", jQuery.StateId);
            return View(jQuery);
        }

        // GET: jQueries/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            jQuery jQuery = db.jQuery.Find(id);
            if (jQuery == null)
            {
                return HttpNotFound();
            }
            ViewBag.PersonId = new SelectList(db.hPerson, "PersonId", "FIO", jQuery.PersonId);
            ViewBag.PersonSpId = new SelectList(db.hPerson, "PersonId", "FIO", jQuery.PersonSpId);
            ViewBag.StateId = new SelectList(db.hState, "StateId", "Description", jQuery.StateId);
            return View(jQuery);
        }

        // POST: jQueries/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "GroupQueryId,QueryId,DateOut,DateIn,DateModification,DeadLine,Text,StateId,PersonId,PersonSpId,Relevance")] jQuery jQuery)
        {
            if (ModelState.IsValid)
            {
                db.Entry(jQuery).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PersonId = new SelectList(db.hPerson, "PersonId", "FIO", jQuery.PersonId);
            ViewBag.PersonSpId = new SelectList(db.hPerson, "PersonId", "FIO", jQuery.PersonSpId);
            ViewBag.StateId = new SelectList(db.hState, "StateId", "Description", jQuery.StateId);
            return View(jQuery);
        }

        // GET: jQueries/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            jQuery jQuery = db.jQuery.Find(id);
            if (jQuery == null)
            {
                return HttpNotFound();
            }
            return View(jQuery);
        }

        // POST: jQueries/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            jQuery jQuery = db.jQuery.Find(id);
            db.jQuery.Remove(jQuery);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
