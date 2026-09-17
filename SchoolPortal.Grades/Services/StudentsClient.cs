using System.Net;
using System.Net.Http.Json;
using SchoolPortal.Grades.Models;

namespace SchoolPortal.Grades.Services;

public class StudentsClient
{
    private readonly HttpClient _httpClient;
    private readonly ILogger<StudentsClient> _logger;

    public StudentsClient(HttpClient httpClient, ILogger<StudentsClient> logger)
    {
        _httpClient = httpClient;
        _logger = logger;
    }

    public async Task<bool> IsStudentExistsAsync(int studentId)
    {
        try
        {
            var response = await _httpClient.GetAsync($"api/students/check/{studentId}");

            if (response.StatusCode == HttpStatusCode.OK)
            {
                return true;
            }

            return false;
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error while calling Students Service for ID: {StudentId}", studentId);

            return false;
        }
    }

    public async Task<List<StudentDto>> GetAllStudentsAsync()
    {
        try
        {
            var response = await _httpClient.GetAsync("Students/GetAll");

            if (response.IsSuccessStatusCode)
            {
                var students = await response.Content.ReadFromJsonAsync<List<StudentDto>>();
                return students ?? new List<StudentDto>();
            }

            _logger.LogWarning("Failed to fetch students. Status: {StatusCode}", response.StatusCode);
            return new List<StudentDto>();
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error while fetching all students from Students Service");
            return new List<StudentDto>();
        }
    }
}