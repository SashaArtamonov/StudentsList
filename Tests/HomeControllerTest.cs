using NUnit.Framework;
using sample.Controllers;
using sample.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Tests
{
    public class HomeControllerTest
    {
        private HomeController _home;

        private string _path;

        [SetUp]
        public void SetUp()
        {
            _home = new HomeController();

            _path =  Path.Combine(AppDomain.CurrentDomain.BaseDirectory,"../../../sample/App_Data");
        }

        [Test]
        public void InitializationTest()
        {
            Students students = _home.Getsample(_path);

            Assert.IsNotNull(students.sample);
        }

        [Test]
        public void DataTest()
        {
            Students students = _home.Getsample(_path);

            Assert.AreEqual(students.sample[0].Age, 19);
            Assert.AreEqual(students.sample[0].Address, "Lviv");
            Assert.AreEqual(students.sample[0].Phone, "123456");
        }

        [Test]
        public void SortTest()
        {  
            Assert.That(() => _home.Sort("Kate"),
                Throws.TypeOf<NullReferenceException>());
        }

    }
}
