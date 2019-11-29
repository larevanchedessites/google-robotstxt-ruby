#include <ruby.h>
#include "robots.h"
#include <string>

typedef VALUE(ruby_method)(...);

extern "C"
{
  static VALUE m_Robotstxt;

  static VALUE robotstxt_allowed_by_robots(VALUE self, VALUE robots_content, VALUE user_agent, VALUE url)
  {
    Check_Type(robots_content, T_STRING);
    Check_Type(user_agent, T_STRING);
    Check_Type(url, T_STRING);

    std::string rc = RSTRING_PTR(robots_content);
    std::string ua = RSTRING_PTR(user_agent);
    std::string ur = RSTRING_PTR(url);

    googlebot::RobotsMatcher matcher;
    bool result = matcher.OneAgentAllowedByRobots(rc, ua, ur);
    return result ? Qtrue : Qfalse;
  }

  void Init_robotstxt()
  {
    m_Robotstxt = rb_define_module("Robotstxt");

    rb_define_method(m_Robotstxt, "allowed_by_robots", (ruby_method *)&robotstxt_allowed_by_robots, 3);
  }
}