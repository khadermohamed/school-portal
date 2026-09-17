namespace SchoolPortal.Grades.Models;

public class StudentDto
{
    public int Id { get; set; }
    public string FirstName { get; set; } = string.Empty;
    public string LastName { get; set; } = string.Empty;
    public string FullName => $"{FirstName} {LastName}";
    public string DisplayName => $"{FirstName} {LastName} (ID: {Id})";
}
