using Geo_Lab_Online.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Geo_Lab_Online.Controllers
{
    public class LessonsController : Controller
    {
        GeolabOnlineDBDataContext db = new GeolabOnlineDBDataContext();
        // GET: Lessons
        public ActionResult Index(int id)
        {
            return View(db.Lessons.Where(a => a.SubjectId == id).ToList());
        }
        public ActionResult Delete(int id)
        {
            var subjectid = db.Lessons.Where(a => a.ID == id).FirstOrDefault();
            int subid = subjectid.SubjectId;
            db.Lessons.DeleteOnSubmit(subjectid);
            db.SubmitChanges();
            return RedirectToAction("Index", "Lessons", new { id = subid });
        }
        #region Edit
        public ActionResult Edit(int id)
        {
            var s = db.Lessons.Where(i => i.ID == id).FirstOrDefault();
            AddLessonsModel lessonsModel = new AddLessonsModel()
            {
                id = s.ID,
                Title = s.LessonsTitel,
                videoURl = s.LessonsVideoLink,
                Desc = s.LessonsDesc,
                lessonselvl = s.LessonsLvl,
                CodeEditor = s.LessonsCodeType.SourceType
            };
            return View(lessonsModel);
        }
        [HttpPost]
        public ActionResult Edit(AddLessonsModel model)
        {
            var less = db.Lessons.Where(a => a.ID == model.id).FirstOrDefault();
            less.LessonsDesc = model.Desc;
            less.LessonsTitel = model.Title;
            less.LessonsVideoLink = model.videoURl;
            less.CodeType = db.LessonsCodeTypes.Where(a => a.SourceType == model.CodeEditor).Select(b => b.ID).FirstOrDefault();
            less.LessonsLvl = model.lessonselvl;
            db.SubmitChanges();
            return RedirectToAction("Index", "Lessons", new { id = model.subjectid });
        }
        #endregion

        public ActionResult Quiz(int id)
        {
            return View(db.LessonQuizs.Where(a => a.LessonId == id).ToList());
        }
        #region AddQuiz
        public ActionResult AddQuiz(int id)
        {
            return View(db.Lessons.Where(a => a.ID == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult AddQuiz(QuizModel id)
        {
            int id2 = Int32.Parse(id.LessonsTitel);
            int lessonId = db.Lessons.Where(a => a.ID == id2).Select(b => b.ID).FirstOrDefault();
            LessonQuiz lessonQuiz = new LessonQuiz()
            {
                CreateDate = DateTime.Now,
                LessonId = lessonId,
                Question = id.quiz
            };
            db.LessonQuizs.InsertOnSubmit(lessonQuiz);
            db.SubmitChanges();
            
            List<LessonQuizAnswer> answerlist = new List<LessonQuizAnswer>() { };
            if (id.List is null) { }
            else
            {
                int correctAnswerID = Int32.Parse(id.correct);
                for (int a = 0; a < id.List.Count; a++)
                {
                    if (correctAnswerID - 1 == a)
                    {
                        answerlist.Add(new LessonQuizAnswer() { Answer = id.List[a], Correct = "Y", QuizId = lessonQuiz.ID });

                    }
                    else
                    {
                        answerlist.Add(new LessonQuizAnswer() { Answer = id.List[a], Correct = "N", QuizId = lessonQuiz.ID });
                    }

                }
                db.LessonQuizAnswers.InsertAllOnSubmit(answerlist);
                db.SubmitChanges();
            }

            return RedirectToAction("Quiz", "Lessons",new { id=lessonId});
        }
#endregion
        public ActionResult Details(int id ) { return View(db.LessonQuizs.Where(a=>a.ID==id).FirstOrDefault()); }
    }
}
