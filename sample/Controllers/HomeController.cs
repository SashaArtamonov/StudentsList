using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml;
using System.Xml.Serialization;
using sample.Models;

namespace sample.Controllers
{
    public class HomeController : Controller
    {
        private Students _students;
               

        //
        // GET: /Home/
        public ActionResult Index()
        {
            return View(Getsample());
        }

        [HttpPost]
        public ActionResult Sort(string studentName)
        {
            Students students= Getsample();

            students.sample = _students.sample.Where(x => x.FullName.ToUpper().Contains(studentName.ToUpper())).ToList();

            return View("Index", students);
        }

        public Students Getsample(string path=null)
        {
            _students = new Students();

            XmlSerializer serializer = new XmlSerializer(typeof(List<Student>), new XmlRootAttribute("sample"));

            var fileName = Path.Combine(path== null? Server.MapPath("~/App_Data"):path, "sample.xml");

            using (var myFileStream = new FileStream(fileName, FileMode.Open))
            {
                XmlReader reader = XmlReader.Create(myFileStream);

                _students.sample = (List<Student>)serializer.Deserialize(reader);
            }

            return _students;
        }

	}
}