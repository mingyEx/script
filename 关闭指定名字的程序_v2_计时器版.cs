using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Timers;

namespace CloseProgram
{
  class Program
  {
    static SortedSet<string> program_name = new SortedSet<string>();
    static int interval = 10000; // 10s
    static void Main(string[] args)
    {
      string text = System.IO.File.ReadAllText(@"C:\Users\mingy\Desktop\test.txt");
      string[] temp = text.Split(',');
      foreach (string s in temp) { program_name.Add(s); }
      System.Timers.Timer timer = new System.Timers.Timer(interval);

      // 设置定时器事件处理函数
      timer.Elapsed += CheckAndCloseProgram;    //why+=?

      timer.AutoReset = true;
      timer.Enabled = true;

      Console.WriteLine("The application started at {0:HH:mm:ss.fff}\ninput anything to stop it.", DateTime.Now);
      Console.ReadLine(); //better way? autoReset可以取代这个吗?

      timer.Stop();
      timer.Dispose();
    }
    static void CheckAndCloseProgram(object sender, ElapsedEventArgs e)
    {
      Process[] processes = Process.GetProcesses();
      foreach (Process process in processes)
      {
        if (program_name.Contains(process.ProcessName))
        {
          //Console.WriteLine($"Found {process.ProcessName} with ID {process.Id}");
          //Console.WriteLine($"current time is {DateTime.Now}\n");
          string str = "Found " + process.ProcessName + " with ID " + process.Id + "\n" + "current time is " + DateTime.Now + "\n";
          File.AppendAllText("log.txt", str);
          try
          {
            process.Kill();
            Console.WriteLine($"Closed {process.ProcessName} successfully.");
          }
          catch (Exception ex)
          {
            Console.WriteLine($"Failed to close {program_name}. Error: {ex.Message}");
          }
        }
      }
    }
  }
}