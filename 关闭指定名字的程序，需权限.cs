using System;
using System.Diagnostics;

namespace CloseProgram
{
  class Program
  {
    static void Main(string[] args)
    {
      // 假设你要检测和关闭的程序名字是example.exe
      string program_name = "Typora";

      // 获取系统中所有正在运行的进程
      Process[] processes = Process.GetProcesses();

      // 遍历每个进程
      foreach (Process process in processes)
      {
        // 如果找到了目标程序
//        if (process.ProcessName == program_name)
        {
          // 打印出来
          Console.WriteLine($"Found {process.ProcessName} /*with ID {process.Id}*/");
          //尝试关闭它
          try
          {
            process.Kill();
            Console.WriteLine($"Closed {program_name} successfully.");
          }
          // 如果遇到错误，比如权限不足或进程不存在
          //但实际上它没发挥作用，权限不足时,列出的内容一样，不能kill.
          catch (Exception e)
          {
            Console.WriteLine($"Failed to close {program_name}. Error: {e.Message}");
          }
        }
      }
    }
  }
}