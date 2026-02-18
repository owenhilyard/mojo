/*
 * ===----------------------------------------------------------------------===
 * # Copyright (c) 2026, Modular Inc. All rights reserved.
 *
 * Licensed under the Apache License v2.0 with LLVM Exceptions:
 * https://llvm.org/LICENSE.txt
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ===----------------------------------------------------------------------===
 * #
 */

#include <unistd.h>

long mojo_sysconf(int name) {
#if (defined(_POSIX_VERSION) || defined(__unix__) || (defined(__APPLE__) && defined(__MACH__)))
  return sysconf(name);
#else
  return -3;
#endif
}

/*
 * POSIX.1 Values
 */
long mojo_sysconf_get_sc_arg_max() { return mojo_sysconf(_SC_ARG_MAX); }

long mojo_sysconf_get_sc_child_max() { return mojo_sysconf(_SC_CHILD_MAX); }

long mojo_sysconf_get_sc_host_name_max() { return mojo_sysconf(_SC_HOST_NAME_MAX); }

long mojo_sysconf_get_sc_login_name_max() {
  return mojo_sysconf(_SC_LOGIN_NAME_MAX);
}

long mojo_sysconf_get_sc_ngroups_max() { return mojo_sysconf(_SC_NGROUPS_MAX); }

long mojo_sysconf_get_sc_clk_tck() { return mojo_sysconf(_SC_CLK_TCK); }

long mojo_sysconf_get_sc_open_max() { return mojo_sysconf(_SC_OPEN_MAX); }

long mojo_sysconf_get_sc_page_size() { return mojo_sysconf(_SC_PAGE_SIZE); }

long mojo_sysconf_get_sc_re_dup_max() { return mojo_sysconf(_SC_RE_DUP_MAX); }

long mojo_sysconf_get_sc_stream_max() { return mojo_sysconf(_SC_STREAM_MAX); }

long mojo_sysconf_get_sc_symloop_max() { return mojo_sysconf(_SC_SYMLOOP_MAX); }

long mojo_sysconf_get_sc_tty_name_max() { return mojo_sysconf(_SC_TTY_NAME_MAX); }

long mojo_sysconf_get_sc_tzname_max() { return mojo_sysconf(_SC_TZNAME_MAX); }

long mojo_sysconf_get_sc_version() { return mojo_sysconf(_SC_VERSION); }

/*
 * POSIX.2 Values
 */
long mojo_sysconf_get_sc_bc_base_max() {
#ifdef _POSIX2_C_VERSION
  return mojo_sysconf(_SC_BC_BASE_MAX);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_bc_dim_max() {
#ifdef _POSIX2_C_VERSION
  return mojo_sysconf(_SC_BC_DIM_MAX);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_bc_scale_max() {
#ifdef _POSIX2_C_VERSION
  return mojo_sysconf(_SC_BC_SCALE_MAX);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_bc_string_max() {
#ifdef _POSIX2_C_VERSION
  return mojo_sysconf(_SC_BC_STRING_MAX);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_coll_weights_max() {
#ifdef _POSIX2_C_VERSION
  return mojo_sysconf(_SC_COLL_WEIGHTS_MAX);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_expr_nest_max() {
#ifdef _POSIX2_C_VERSION
  return mojo_sysconf(_SC_EXPR_NEST_MAX);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_line_max() {
#ifdef _POSIX2_C_VERSION
  return mojo_sysconf(_SC_LINE_MAX);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_2_version() {
#ifdef _POSIX2_C_VERSION
  return mojo_sysconf(_SC_2_VERSION);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_2_c_dev() {
#ifdef _POSIX2_C_VERSION
  return mojo_sysconf(_SC_2_C_DEV);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_2_fort_dev() {
#ifdef _POSIX2_C_VERSION
  return mojo_sysconf(_SC_2_FORT_DEV);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_2_fort_run() {
#ifdef _POSIX2_C_VERSION
  return mojo_sysconf(_SC_2_FORT_RUN);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_2_localedef() {
#ifdef _POSIX2_C_VERSION
  return mojo_sysconf(_SC_2_LOCALEDEF);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_2_sw_dev() {
#ifdef _POSIX2_C_VERSION
  return mojo_sysconf(_SC_2_SW_DEV);
#else
  return -2;
#endif
}

/*
 * POSIX.1 Optional Features
 */
long mojo_sysconf_get_sc_advisory_info() {
#ifdef _POSIX_ADVISORY_INFO
  return mojo_sysconf(_SC_ADVISORY_INFO);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_asynchronous_io() {
#ifdef _POSIX_ASYNCHRONOUS_IO
  return mojo_sysconf(_SC_ASYNCHRONOUS_IO);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_barriers() {
#ifdef _POSIX_BARRIERS
  return mojo_sysconf(_SC_BARRIERS);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_clock_selection() {
#ifdef _POSIX_CLOCK_SELECTION
  return mojo_sysconf(_SC_CLOCK_SELECTION);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_cputime() {
#ifdef _POSIX_CPUTIME
  return mojo_sysconf(_SC_CPUTIME);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_fsync() {
#ifdef _POSIX_FSYNC
  return mojo_sysconf(_SC_FSYNC);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_ipv6() {
#ifdef _POSIX_IPV6
  return mojo_sysconf(_SC_IPV6);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_mapped_files() {
#ifdef _POSIX_MAPPED_FILES
  return mojo_sysconf(_SC_MAPPED_FILES);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_memlock() {
#ifdef _POSIX_MEMLOCK
  return mojo_sysconf(_SC_MEMLOCK);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_memlock_range() {
#ifdef _POSIX_MEMLOCK_RANGE
  return mojo_sysconf(_SC_MEMLOCK_RANGE);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_memory_protection() {
#ifdef _POSIX_MEMORY_PROTECTION
  return mojo_sysconf(_SC_MEMORY_PROTECTION);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_message_passing() {
#ifdef _POSIX_MESSAGE_PASSING
  return mojo_sysconf(_SC_MESSAGE_PASSING);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_monotonic_clock() {
#ifdef _POSIX_MONOTONIC_CLOCK
  return mojo_sysconf(_SC_MONOTONIC_CLOCK);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_prioritized_io() {
#ifdef _POSIX_PRIORITIZED_IO
  return mojo_sysconf(_SC_PRIORITIZED_IO);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_priority_scheduling() {
#ifdef _POSIX_PRIORITY_SCHEDULING
  return mojo_sysconf(_SC_PRIORITY_SCHEDULING);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_reader_writer_locks() {
#ifdef _POSIX_READER_WRITER_LOCKS
  return mojo_sysconf(_SC_READER_WRITER_LOCKS);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_realtime_signals() {
#ifdef _POSIX_REALTIME_SIGNALS
  return mojo_sysconf(_SC_REALTIME_SIGNALS);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_semaphores() {
#ifdef _POSIX_SEMAPHORES
  return mojo_sysconf(_SC_SEMAPHORES);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_shared_memory_objects() {
#ifdef _POSIX_SHARED_MEMORY_OBJECTS
  return mojo_sysconf(_SC_SHARED_MEMORY_OBJECTS);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_spawn() {
#ifdef _POSIX_SPAWN
  return mojo_sysconf(_SC_SPAWN);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_spin_locks() {
#ifdef _POSIX_SPIN_LOCKS
  return mojo_sysconf(_SC_SPIN_LOCKS);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_sporadic_server() {
#ifdef _POSIX_SPORADIC_SERVER
  return mojo_sysconf(_SC_SPORADIC_SERVER);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_synchronized_io() {
#ifdef _POSIX_SYNCHRONIZED_IO
  return mojo_sysconf(_SC_SYNCHRONIZED_IO);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_thread_attr_stackaddr() {
#ifdef _POSIX_THREAD_ATTR_STACKADDR
  return mojo_sysconf(_SC_THREAD_ATTR_STACKADDR);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_thread_attr_stacksize() {
#ifdef _POSIX_THREAD_ATTR_STACKSIZE
  return mojo_sysconf(_SC_THREAD_ATTR_STACKSIZE);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_thread_cputime() {
#ifdef _POSIX_THREAD_CPUTIME
  return mojo_sysconf(_SC_THREAD_CPUTIME);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_thread_prio_inherit() {
#ifdef _POSIX_THREAD_PRIO_INHERIT
  return mojo_sysconf(_SC_THREAD_PRIO_INHERIT);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_thread_prio_protect() {
#ifdef _POSIX_THREAD_PRIO_PROTECT
  return mojo_sysconf(_SC_THREAD_PRIO_PROTECT);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_thread_priority_scheduling() {
#ifdef _POSIX_THREAD_PRIORITY_SCHEDULING
  return mojo_sysconf(_SC_THREAD_PRIORITY_SCHEDULING);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_thread_process_shared() {
#ifdef _POSIX_THREAD_PROCESS_SHARED
  return mojo_sysconf(_SC_THREAD_PROCESS_SHARED);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_thread_safe_functions() {
#ifdef _POSIX_THREAD_SAFE_FUNCTIONS
  return mojo_sysconf(_SC_THREAD_SAFE_FUNCTIONS);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_thread_sporadic_server() {
#ifdef _POSIX_THREAD_SPORADIC_SERVER
  return mojo_sysconf(_SC_THREAD_SPORADIC_SERVER);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_threads() {
#ifdef _POSIX_THREADS
  return mojo_sysconf(_SC_THREADS);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_timeouts() {
#ifdef _POSIX_TIMEOUTS
  return mojo_sysconf(_SC_TIMEOUTS);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_timers() {
#ifdef _POSIX_TIMERS
  return mojo_sysconf(_SC_TIMERS);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_trace() {
#ifdef _POSIX_TRACE
  return mojo_sysconf(_SC_TRACE);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_trace_event_filter() {
#ifdef _POSIX_TRACE_EVENT_FILTER
  return mojo_sysconf(_SC_TRACE_EVENT_FILTER);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_trace_inherit() {
#ifdef _POSIX_TRACE_INHERIT
  return mojo_sysconf(_SC_TRACE_INHERIT);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_trace_log() {
#ifdef _POSIX_TRACE_LOG
  return mojo_sysconf(_SC_TRACE_LOG);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_typed_memory_objects() {
#ifdef _POSIX_TYPED_MEMORY_OBJECTS
  return mojo_sysconf(_SC_TYPED_MEMORY_OBJECTS);
#else
  return -2;
#endif
}

/*
 * X/OPEN System Interface Extensions
 */
long mojo_sysconf_get_sc_xopen_crypt() {
#ifdef _XOPEN_CRYPT
  return mojo_sysconf(_SC_XOPEN_CRYPT);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_xopen_realtime() {
#ifdef _XOPEN_REALTIME
  return mojo_sysconf(_SC_XOPEN_REALTIME);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_xopen_realtime_threads() {
#ifdef _XOPEN_REALTIME_THREADS
  return mojo_sysconf(_SC_XOPEN_REALTIME_THREADS);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_xopen_streams() {
#ifdef _XOPEN_STREAMS
  return mojo_sysconf(_SC_XOPEN_STREAMS);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_xopen_legacy() {
#ifdef _XOPEN_LEGACY
  return mojo_sysconf(_SC_XOPEN_LEGACY);
#else
  return -2;
#endif
}

long mojo_sysconf_get_sc_xopen_unix() {
#ifdef _XOPEN_UNIX
  return mojo_sysconf(_SC_XOPEN_UNIX);
#else
  return -2;
#endif
}
