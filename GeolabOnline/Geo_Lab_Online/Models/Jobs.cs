using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Geo_Lab_Online.Models
{
    public class Jobs
    {
        ExtDbDataContext extdb = new ExtDbDataContext();
        GeolabOnlineDBDataContext geolabOnline = new GeolabOnlineDBDataContext();
        #region DirectionMigr
        public void DirectionMigr()
        {
            var ExtDirection = extdb.ExtDirection_Trans.Where(a => a.LanguageCode == "ka-ge").ToList();
            var CurrentDirection = geolabOnline.Directions.ToList();
            var id = ExtDirection.Select(q => q.DirectionID).ToList();
            var update = geolabOnline.Directions.Where(a => id.Contains(a.ID)).ToList();
            var add = ExtDirection.Where(a => !CurrentDirection.Select(s => s.ID).Contains(a.DirectionID)).ToList();
            List<Direction> listDir = new List<Direction>();
            foreach (var s in add)
            {
                listDir.Add(
                    new Direction
                    {
                        ID = s.DirectionID,
                        DirectionTitle = s.DirectionName,
                        DirectionDesc = s.DirectionDescription
                    });
            }
            if (listDir != null)
            {
                geolabOnline.Directions.InsertAllOnSubmit(listDir);
                geolabOnline.SubmitChanges();
            }

            if (update != null)
            {
                foreach (var t in update)
                {
                    foreach (var ext in ExtDirection)
                    {
                        if (t.ID == ext.DirectionID)
                        {
                            t.DirectionTitle = ext.DirectionName;
                            t.DirectionDesc = ext.DirectionDescription;
                            geolabOnline.SubmitChanges();

                        }
                    }

                }
            }


        }
        #endregion
        #region CourseMigr

        public void CourseMigr()
        {
            var ExtCourse = extdb.ExtCourses.Select
                (a => new
                {
                    a.CourseID,
                    a.CourseDirectionID,
                    CourseName = a.ExtCourse_Trans.Where(w => w.CourseID == a.CourseID && w.LanguageCode == "ka-ge").Select(z => z.CourseName).FirstOrDefault(),
                    CourseDesc = a.ExtCourse_Trans.Where(w => w.CourseID == a.CourseID && w.LanguageCode == "ka-ge").Select(z => z.CourseDescription).FirstOrDefault()
                }).ToList();

            var CurrentCourse = geolabOnline.Courses.ToList();
            var id = ExtCourse.Select(q => q.CourseID).ToList();
            var update = geolabOnline.Courses.Where(a => id.Contains(a.ID)).ToList();
            var add = ExtCourse.Where(a => !CurrentCourse.Select(s => s.ID).Contains(a.CourseID)).ToList();
            List<Course> listCou = new List<Course>();

            foreach (var s in add)
            {
                listCou.Add(
                    new Course
                    {
                        ID = s.CourseID,
                        CourseTitle = s.CourseName,
                        CourseDesc = s.CourseDesc,
                        DirectionId = s.CourseDirectionID
                    });
            }
            if (listCou != null)
            {
                geolabOnline.Courses.InsertAllOnSubmit(listCou);
                geolabOnline.SubmitChanges();
            }

            if (update != null)
            {
                foreach (var t in update)
                {
                    foreach (var ext in ExtCourse)
                    {
                        if (t.ID == ext.CourseID)
                        {
                            t.CourseTitle = ext.CourseName;
                            t.CourseDesc = ext.CourseDesc;
                            geolabOnline.SubmitChanges();
                        }
                    }

                }
            }

        }
        #endregion
        #region SubjectMigr
        public void SubjectMigr()
        {
            var ExtSubject = extdb.ExtSubjects.Select
               (a => new
               {
                   a.SubjectID,
                   SubjectName = a.ExtSubject_Trans.Where(w => w.SubjectID == a.SubjectID && w.LanguageCode == "ka-ge").Select(z => z.Name).FirstOrDefault()
               }).ToList();
            var CurrentSubject = geolabOnline.Subjects.ToList();
            var id = ExtSubject.Select(q => q.SubjectID).ToList();
            var update = geolabOnline.Subjects.Where(a => id.Contains(a.ID)).ToList();
            var add = ExtSubject.Where(a => !CurrentSubject.Select(s => s.ID).Contains(a.SubjectID)).ToList();
            List<Subject> listSub = new List<Subject>();
            foreach (var s in add)
            {
                listSub.Add(
                    new Subject
                    {
                        ID = s.SubjectID,
                        SubjectTitle = s.SubjectName

                    });
            }
            if (listSub != null)
            {
                geolabOnline.Subjects.InsertAllOnSubmit(listSub);
                geolabOnline.SubmitChanges();
            }

            if (update != null)
            {
                foreach (var t in update)
                {
                    foreach (var ext in ExtSubject)
                    {
                        if (t.ID == ext.SubjectID)
                        {
                            t.SubjectTitle = ext.SubjectName;
                            geolabOnline.SubmitChanges();
                        }
                    }

                }
            }

            var Course_Subjectslist = extdb.ExtCourse_Subjects.ToList();
            geolabOnline.CourseSubjects.DeleteAllOnSubmit(geolabOnline.CourseSubjects.ToList());
            geolabOnline.SubmitChanges();
            foreach (var a in Course_Subjectslist)
            {
                geolabOnline.CourseSubjects.InsertOnSubmit(new CourseSubject() { CourseID = a.CourseID, SubjectID = a.SubjectID });
                geolabOnline.SubmitChanges();
            }


        }

        #endregion
        #region LectureMig
        public void LectureMig()
        {
            var ExtLecture = extdb.ExtUsers
                .Where(a => a.ExtUser_Categories.Any(b => b.UserCategoryID == 1 || b.UserCategoryID == 5))
                .Select(q =>
                new
                {
                    q.UserID,
                    q.UserPhoto,q.UserBio,
                    q.UserName,
                    q.UserSurname,
                    q.UserEmail,
                    UserSubject = q.ExtSubject_Lecturers.Where(a => a.LecturerID == q.UserID).Select(w => w.SubjectID).FirstOrDefault()
                })
                .ToList();

            var CurrentLect = geolabOnline.Lectures.ToList();
            var id = ExtLecture.Select(q => q.UserID).ToList();
            var update = geolabOnline.Lectures.Where(a => id.Contains(a.ID)).ToList();
            var add = ExtLecture.Where(a => !CurrentLect.Select(s => s.ID).Contains(a.UserID)).ToList();

            List<Lecture> listLec = new List<Lecture>();

            foreach (var s in add)
            {
                listLec.Add(
                    new Lecture
                    {
                        ID = s.UserID,
                        FirstName=s.UserName, LastName=s.UserSurname,UserBio=s.UserBio, UserPhoto=s.UserPhoto, UserMail=s.UserEmail, UserSubject=s.UserSubject

                    });
            }
            if (listLec != null)
            {
                geolabOnline.Lectures.InsertAllOnSubmit(listLec);
                geolabOnline.SubmitChanges();
            }
        }
        #endregion
    }
}