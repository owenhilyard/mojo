# ===----------------------------------------------------------------------=== #
# Copyright (c) 2026, Modular Inc. All rights reserved.
#
# Licensed under the Apache License v2.0 with LLVM Exceptions:
# https://llvm.org/LICENSE.txt
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ===----------------------------------------------------------------------=== #
"""This module provides functions for retrieving system configuration 
information via the POSIX sysconf() interface."""

from ffi import c_long, external_call
from utils import Variant


@fieldwise_init
struct SysconfDefineNotPresentError[function_name: StringLiteral](
    ImplicitlyCopyable, Movable
):
    """Error indicating that a requested sysconf define (`_SC_*`) is not defined
    on this system."""

    pass


@fieldwise_init
struct SysconfInvalidArgumentError(ImplicitlyCopyable, Movable):
    """Error indicating that an invalid argument was passed to a sysconf
    function."""

    pass


@fieldwise_init
struct SysconfNotPosixSystemError(ImplicitlyCopyable, Movable):
    """Error indicating that the system does not support POSIX standards, and
    thus sysconf is not supported."""

    pass


__extension Error:
    @implicit
    fn __init__(out self, var error: SysconfDefineNotPresentError):
        self = Error("Sysconf define not found: " + error.function_name)

    @implicit
    fn __init__(out self, var error: SysconfInvalidArgumentError):
        self = Error("Invalid argument passed to sysconf")

    @implicit
    fn __init__(out self, var error: SysconfNotPosixSystemError):
        self = Error("sysconf is not supported on non-POSIX systems")


fn _get_mojo_sysconf_value[
    fn_name: StringLiteral, sc_define_name: StringLiteral
]() raises Variant[
    SysconfDefineNotPresentError[sc_define_name],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    var result = external_call[fn_name, c_long]()
    if result == -1:
        raise {SysconfInvalidArgumentError()}
    elif result == -2:
        raise {SysconfDefineNotPresentError[sc_define_name]()}
    elif result == -3:
        raise {SysconfNotPosixSystemError()}
    return result


fn get_sc_pagesize() raises Variant[
    SysconfDefineNotPresentError["_SC_PAGESIZE"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the system page size in bytes.

    This function retrieves the value of the `_SC_PAGESIZE` configuration parameter,
    which represents the size of a page in bytes on the system. This is the fundamental
    unit of memory that the system manages.

    The page size is used by memory management functions to align memory allocations
    and is essential for understanding virtual memory operations.

    Returns:
      The page size in bytes. The value must not be less than 1.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_PAGESIZE` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.

    Note:
      `PAGE_SIZE` is a synonym for `PAGESIZE/_SC_PAGESIZE`. Both are specified in
      POSIX.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_pagesize", "_SC_PAGESIZE"
    ]()


fn get_sc_arg_max() raises Variant[
    SysconfDefineNotPresentError["_SC_ARG_MAX"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the maximum length of arguments to the exec family of functions.

    This function retrieves the value of the `_SC_ARG_MAX` configuration parameter,
    which represents the maximum length of the arguments to the exec(3) family of
    functions. This limit includes all arguments passed to a process upon execution.

    Returns:
      The maximum argument length in bytes. Must not be less than _POSIX_ARG_MAX (4096).

    Raises:
      SysconfDefineNotPresentError: If the `_SC_ARG_MAX` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_arg_max", "_SC_ARG_MAX"
    ]()


fn get_sc_child_max() raises Variant[
    SysconfDefineNotPresentError["_SC_CHILD_MAX"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the maximum number of simultaneous processes per user ID.

    This function retrieves the value of the `_SC_CHILD_MAX` configuration parameter,
    which represents the maximum number of simultaneous processes that can be created
    per user ID on the system.

    Returns:
      The maximum number of simultaneous processes per user ID. Must not be less than
      _POSIX_CHILD_MAX (25).

    Raises:
      SysconfDefineNotPresentError: If the `_SC_CHILD_MAX` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_child_max", "_SC_CHILD_MAX"
    ]()


fn get_sc_host_name_max() raises Variant[
    SysconfDefineNotPresentError["_SC_HOST_NAME_MAX"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the maximum length of a hostname.

    This function retrieves the value of the `_SC_HOST_NAME_MAX` configuration parameter,
    which represents the maximum length of a hostname, not including the terminating null byte,
    as returned by gethostname(2).

    Returns:
      The maximum length of a hostname in bytes. Must not be less than
      _POSIX_HOST_NAME_MAX (255).

    Raises:
      SysconfDefineNotPresentError: If the `_SC_HOST_NAME_MAX` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_host_name_max", "_SC_HOST_NAME_MAX"
    ]()


fn get_sc_login_name_max() raises Variant[
    SysconfDefineNotPresentError["_SC_LOGIN_NAME_MAX"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the maximum length of a login name.

    This function retrieves the value of the `_SC_LOGIN_NAME_MAX` configuration parameter,
    which represents the maximum length of a login name, including the terminating null byte.

    Returns:
      The maximum length of a login name in bytes. Must not be less than
      _POSIX_LOGIN_NAME_MAX (9).

    Raises:
      SysconfDefineNotPresentError: If the `_SC_LOGIN_NAME_MAX` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_login_name_max", "_SC_LOGIN_NAME_MAX"
    ]()


fn get_sc_ngroups_max() raises Variant[
    SysconfDefineNotPresentError["_SC_NGROUPS_MAX"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the maximum number of supplementary group IDs.

    This function retrieves the value of the `_SC_NGROUPS_MAX` configuration parameter,
    which represents the maximum number of supplementary group IDs that a process can have.

    Returns:
      The maximum number of supplementary group IDs.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_NGROUPS_MAX` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_ngroups_max", "_SC_NGROUPS_MAX"
    ]()


fn get_sc_clk_tck() raises Variant[
    SysconfDefineNotPresentError["_SC_CLK_TCK"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the number of clock ticks per second.

    This function retrieves the value of the `_SC_CLK_TCK` configuration parameter,
    which represents the number of clock ticks per second. This value is used to convert
    elapsed time measurements from clock ticks to seconds.

    Returns:
      The number of clock ticks per second.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_CLK_TCK` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.

    Note: The corresponding variable is obsolete. The macro CLOCKS_PER_SEC does not give
      information; it must equal 1000000.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_clk_tck", "_SC_CLK_TCK"
    ]()


fn get_sc_open_max() raises Variant[
    SysconfDefineNotPresentError["_SC_OPEN_MAX"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the maximum number of open file descriptors per process.

    This function retrieves the value of the `_SC_OPEN_MAX` configuration parameter,
    which represents the maximum number of files that a process can have open at any time.

    Returns:
      The maximum number of open files. Must not be less than _POSIX_OPEN_MAX (20).

    Raises:
      SysconfDefineNotPresentError: If the `_SC_OPEN_MAX` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_open_max", "_SC_OPEN_MAX"
    ]()


fn get_sc_page_size() raises Variant[
    SysconfDefineNotPresentError["_SC_PAGE_SIZE"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the system page size in bytes (synonym for page size).

    This function retrieves the value of the `_SC_PAGE_SIZE` configuration parameter,
    which is a synonym for `PAGESIZE/_SC_PAGESIZE`. Both `PAGESIZE` and `PAGE_SIZE` are
    specified in POSIX and represent the size of a page in bytes on the system.

    Returns:
      The page size in bytes. Must not be less than 1.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_PAGE_SIZE` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_page_size", "_SC_PAGE_SIZE"
    ]()


fn get_sc_phys_pages() raises Variant[
    SysconfDefineNotPresentError["_SC_PHYS_PAGES"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the number of pages of physical memory.

    This function retrieves the value of the `_SC_PHYS_PAGES` configuration parameter,
    which represents the total number of pages of physical memory available on the system.

    Note: It is possible for the product of this value and the value of _SC_PAGESIZE to overflow.

    Returns:
      The number of pages of physical memory.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_PHYS_PAGES` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_phys_pages", "_SC_PHYS_PAGES"
    ]()


fn get_sc_avphys_pages() raises Variant[
    SysconfDefineNotPresentError["_SC_AVPHYS_PAGES"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the number of currently available pages of physical memory.

    This function retrieves the value of the `_SC_AVPHYS_PAGES` configuration parameter,
    which represents the number of pages of physical memory that are currently available
    for allocation.

    Returns:
      The number of currently available pages of physical memory.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_AVPHYS_PAGES` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_avphys_pages", "_SC_AVPHYS_PAGES"
    ]()


fn get_sc_nprocessors_conf() raises Variant[
    SysconfDefineNotPresentError["_SC_NPROCESSORS_CONF"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the number of processors configured on the system.

    This function retrieves the value of the `_SC_NPROCESSORS_CONF` configuration parameter,
    which represents the total number of processors that are configured on the system,
    regardless of whether they are currently online.

    Returns:
      The number of processors configured.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_NPROCESSORS_CONF` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_nprocessors_conf", "_SC_NPROCESSORS_CONF"
    ]()


fn get_sc_nprocessors_onln() raises Variant[
    SysconfDefineNotPresentError["_SC_NPROCESSORS_ONLN"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the number of processors currently online.

    This function retrieves the value of the `_SC_NPROCESSORS_ONLN` configuration parameter,
    which represents the number of processors that are currently online and available for use.

    Returns:
      The number of processors currently online (available).

    Raises:
      SysconfDefineNotPresentError: If the `_SC_NPROCESSORS_ONLN` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_nprocessors_onln", "_SC_NPROCESSORS_ONLN"
    ]()


fn get_sc_job_control() raises Variant[
    SysconfDefineNotPresentError["_SC_JOB_CONTROL"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether the system implements POSIX-style job control.

    This function retrieves the value of the `_SC_JOB_CONTROL` configuration parameter.
    If this option is in effect (as it always is under POSIX.1-2001), then the system
    implements POSIX-style job control with functions such as setpgid(), tcgetpgrp(),
    and tcsetpgrp().

    Returns:
      A positive value if job control is supported, -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_JOB_CONTROL` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_job_control", "_SC_JOB_CONTROL"
    ]()


fn get_sc_chown_restricted() raises Variant[
    SysconfDefineNotPresentError["_SC_CHOWN_RESTRICTED"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether chown() restrictions are in effect.

    This function retrieves the value of the `_SC_CHOWN_RESTRICTED` configuration parameter.
    If this option is in effect (as it always is under POSIX.1-2001), then only root may
    change the owner of a file, and nonroot can set the group of a file only to one of
    the groups it belongs to. This affects the chown() and fchown() functions.

    Returns:
      A positive value if chown() restrictions are in effect, -1 otherwise.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_CHOWN_RESTRICTED` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_chown_restricted", "_SC_CHOWN_RESTRICTED"
    ]()


fn get_sc_no_trunc() raises Variant[
    SysconfDefineNotPresentError["_SC_NO_TRUNC"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether pathname components longer than NAME_MAX are truncated.

    This function retrieves the value of the `_SC_NO_TRUNC` configuration parameter.
    If this option is in effect (as it always is under POSIX.1-2001), then pathname
    components longer than NAME_MAX are not truncated, but instead result in an error.
    This property may be dependent on the path prefix of the component.

    Returns:
      A positive value if long pathnames cause errors (no truncation), -1 if truncation occurs.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_NO_TRUNC` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_no_trunc", "_SC_NO_TRUNC"
    ]()


fn get_sc_regexp() raises Variant[
    SysconfDefineNotPresentError["_SC_REGEXP"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX regular expressions are supported.

    This function retrieves the value of the `_SC_REGEXP` configuration parameter.
    If this option is in effect (as it always is under POSIX.1-2001), then POSIX
    regular expressions are supported with functions such as regcomp(), regexec(),
    regerror(), and regfree().

    Returns:
      A positive value if POSIX regular expressions are supported, -1 if not.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_REGEXP` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value["mojo_sysconf_get_sc_regexp", "_SC_REGEXP"]()


fn get_sc_saved_ids() raises Variant[
    SysconfDefineNotPresentError["_SC_SAVED_IDS"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether the system supports saved set-user-ID and set-group-ID.

    This function retrieves the value of the `_SC_SAVED_IDS` configuration parameter.
    If this option is in effect (as it always is under POSIX.1-2001), then a process
    has a saved set-user-ID and a saved set-group-ID. This affects the exec(), kill(),
    seteuid(), setegid(), setgid(), and setuid() functions.

    Returns:
      A positive value if saved IDs are supported, -1 if not.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_SAVED_IDS` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_saved_ids", "_SC_SAVED_IDS"
    ]()


fn get_sc_shell() raises Variant[
    SysconfDefineNotPresentError["_SC_SHELL"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether the POSIX shell is supported.

    This function retrieves the value of the `_SC_SHELL` configuration parameter.
    If this option is in effect (as it always is under POSIX.1-2001), then the
    system() function is present for executing shell commands.

    Returns:
      A positive value if the POSIX shell is supported, -1 if not.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_SHELL` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value["mojo_sysconf_get_sc_shell", "_SC_SHELL"]()


fn get_sc_vdisable() raises Variant[
    SysconfDefineNotPresentError["_SC_VDISABLE"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the value to disable a changeable special control character.

    This function retrieves the value of the `_SC_VDISABLE` configuration parameter,
    which is the value to set a changeable special control character to indicate that
    it is disabled. This value is always present and is typically 0.

    Returns:
      The value used to disable control characters (typically 0).

    Raises:
      SysconfDefineNotPresentError: If the `_SC_VDISABLE` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_vdisable", "_SC_VDISABLE"
    ]()


fn get_sc_file_locking() raises Variant[
    SysconfDefineNotPresentError["_SC_FILE_LOCKING"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX file locking is supported.

    Note: This option has been deleted and is not in final XPG6.

    Returns:
      A positive value if file locking is supported, -1 if not.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_FILE_LOCKING` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_file_locking", "_SC_FILE_LOCKING"
    ]()


fn get_sc_multi_process() raises Variant[
    SysconfDefineNotPresentError["_SC_MULTI_PROCESS"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether multi-process support is available.

    Note: This option has been deleted and is not in final XPG6.

    Returns:
      The current value of the multi-process configuration parameter.

    Raises:
      SysconfDefineNotPresentError: If the _SC_MULTI_PROCESS configuration parameter is not defined.
      SysconfInvalidArgumentError: If the configuration parameter name is invalid.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_multi_process", "_SC_MULTI_PROCESS"
    ]()


fn get_sc_re_dup_max() raises Variant[
    SysconfDefineNotPresentError["_SC_RE_DUP_MAX"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the maximum number of repeated occurrences in a regular expression.

    This function retrieves the value of the `_SC_RE_DUP_MAX` configuration parameter,
    which represents the number of repeated occurrences of a BRE (Basic Regular Expression)
    permitted by regexec(3) and regcomp(3). This limit applies when using the interval
    notation {m,n} in regular expressions.

    Returns:
      The maximum number of repeated occurrences of a regular expression. Must not be less
      than _POSIX2_RE_DUP_MAX (255).

    Raises:
      SysconfDefineNotPresentError: If the `_SC_RE_DUP_MAX` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_re_dup_max", "_SC_RE_DUP_MAX"
    ]()


fn get_sc_stream_max() raises Variant[
    SysconfDefineNotPresentError["_SC_STREAM_MAX"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the maximum number of open streams per process.

    This function retrieves the value of the `_SC_STREAM_MAX` configuration parameter,
    which represents the maximum number of streams that a process can have open at any time.
    If defined, it has the same value as the standard C macro FOPEN_MAX.

    Returns:
      The maximum number of streams that a process can have open at any time. Must not be
      less than _POSIX_STREAM_MAX (8).

    Raises:
      SysconfDefineNotPresentError: If the `_SC_STREAM_MAX` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_stream_max", "_SC_STREAM_MAX"
    ]()


fn get_sc_symloop_max() raises Variant[
    SysconfDefineNotPresentError["_SC_SYMLOOP_MAX"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the maximum number of symbolic links in a pathname.

    This function retrieves the value of the `_SC_SYMLOOP_MAX` configuration parameter,
    which represents the maximum number of symbolic links that can be encountered in a
    pathname before resolution returns ELOOP (too many levels of symbolic links).

    Returns:
      The maximum number of symbolic links seen in a pathname before resolution returns ELOOP.
      Must not be less than _POSIX_SYMLOOP_MAX (8).

    Raises:
      SysconfDefineNotPresentError: If the `_SC_SYMLOOP_MAX` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_symloop_max", "_SC_SYMLOOP_MAX"
    ]()


fn get_sc_tty_name_max() raises Variant[
    SysconfDefineNotPresentError["_SC_TTY_NAME_MAX"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the maximum length of a terminal device name.

    This function retrieves the value of the `_SC_TTY_NAME_MAX` configuration parameter,
    which represents the maximum length of a terminal device name, including the
    terminating null byte.

    Returns:
      The maximum length of a terminal device name in bytes. Must not be less than
      _POSIX_TTY_NAME_MAX (9).

    Raises:
      SysconfDefineNotPresentError: If the `_SC_TTY_NAME_MAX` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_tty_name_max", "_SC_TTY_NAME_MAX"
    ]()


fn get_sc_tzname_max() raises Variant[
    SysconfDefineNotPresentError["_SC_TZNAME_MAX"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the maximum number of bytes in a timezone name.

    This function retrieves the value of the `_SC_TZNAME_MAX` configuration parameter,
    which represents the maximum number of bytes in a timezone name.

    Returns:
      The maximum number of bytes in a timezone name. Must not be less than
      _POSIX_TZNAME_MAX (6).

    Raises:
      SysconfDefineNotPresentError: If the `_SC_TZNAME_MAX` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_tzname_max", "_SC_TZNAME_MAX"
    ]()


fn get_sc_version() raises Variant[
    SysconfDefineNotPresentError["_SC_VERSION"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the POSIX.1 standard version.

    This function retrieves the value of the `_SC_VERSION` configuration parameter
    (corresponding to _POSIX_VERSION), which indicates the year and month the POSIX.1
    standard was approved in the format YYYYMML. For example, the value 199009L indicates
    the September 1990 revision of POSIX.1.

    Returns:
      The version of the POSIX.1 standard in YYYYMML format.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_VERSION` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_version", "_SC_VERSION"
    ]()


fn get_sc_bc_base_max() raises Variant[
    SysconfDefineNotPresentError["_SC_BC_BASE_MAX"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the maximum obase value accepted by the bc utility.

    This function retrieves the value of the `_SC_BC_BASE_MAX` configuration parameter,
    which indicates the maximum base (obase) value that the bc(1) utility accepts for
    numeric output.

    Returns:
      The maximum obase value accepted by the bc(1) utility.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_BC_BASE_MAX` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_bc_base_max", "_SC_BC_BASE_MAX"
    ]()


fn get_sc_bc_dim_max() raises Variant[
    SysconfDefineNotPresentError["_SC_BC_DIM_MAX"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the maximum value of array elements for the bc utility.

    This function retrieves the value of the `_SC_BC_DIM_MAX` configuration parameter,
    which indicates the maximum value of elements permitted in an array by the bc(1) utility.

    Returns:
      The maximum value of array elements permitted by the bc(1) utility.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_BC_DIM_MAX` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_bc_dim_max", "_SC_BC_DIM_MAX"
    ]()


fn get_sc_bc_scale_max() raises Variant[
    SysconfDefineNotPresentError["_SC_BC_SCALE_MAX"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the maximum scale value allowed by the bc utility.

    This function retrieves the value of the `_SC_BC_SCALE_MAX` configuration parameter,
    which indicates the maximum scale value that the bc(1) utility allows for calculations.

    Returns:
      The maximum scale value allowed by the bc(1) utility.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_BC_SCALE_MAX` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_bc_scale_max", "_SC_BC_SCALE_MAX"
    ]()


fn get_sc_bc_string_max() raises Variant[
    SysconfDefineNotPresentError["_SC_BC_STRING_MAX"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the maximum length of a string accepted by the bc utility.

    This function retrieves the value of the `_SC_BC_STRING_MAX` configuration parameter,
    which indicates the maximum length of a string that the bc(1) utility accepts.

    Returns:
      The maximum length of a string accepted by the bc(1) utility.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_BC_STRING_MAX` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_bc_string_max", "_SC_BC_STRING_MAX"
    ]()


fn get_sc_coll_weights_max() raises Variant[
    SysconfDefineNotPresentError["_SC_COLL_WEIGHTS_MAX"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the maximum number of weights in locale collation.

    This function retrieves the value of the `_SC_COLL_WEIGHTS_MAX` configuration parameter,
    which indicates the maximum number of weights that can be assigned to an entry of the
    LC_COLLATE order keyword in the locale definition file.

    Returns:
      The maximum number of weights for locale collation entries.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_COLL_WEIGHTS_MAX` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_coll_weights_max", "_SC_COLL_WEIGHTS_MAX"
    ]()


fn get_sc_expr_nest_max() raises Variant[
    SysconfDefineNotPresentError["_SC_EXPR_NEST_MAX"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the maximum nesting level for the expr utility.

    This function retrieves the value of the `_SC_EXPR_NEST_MAX` configuration parameter,
    which represents the maximum number of expressions that can be nested within
    parentheses by the expr(1) utility.

    Returns:
      The maximum number of expressions that can be nested within parentheses by expr(1).

    Raises:
      SysconfDefineNotPresentError: If the `_SC_EXPR_NEST_MAX` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_expr_nest_max", "_SC_EXPR_NEST_MAX"
    ]()


fn get_sc_line_max() raises Variant[
    SysconfDefineNotPresentError["_SC_LINE_MAX"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the maximum length of a utility's input line.

    This function retrieves the value of the `_SC_LINE_MAX` configuration parameter,
    which represents the maximum length of a utility's input line, either from standard
    input or from a file. This includes space for a trailing newline.

    Returns:
      The maximum length of a utility's input line in bytes.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_LINE_MAX` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_line_max", "_SC_LINE_MAX"
    ]()


fn get_sc_2_version() raises Variant[
    SysconfDefineNotPresentError["_SC_2_VERSION"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets the POSIX.2 standard version.

    This function retrieves the value of the `_SC_2_VERSION` configuration parameter
    (corresponding to POSIX2_VERSION), which indicates the version of the POSIX.2 standard
    in the format YYYYMML.

    Returns:
      The version of the POSIX.2 standard in YYYYMML format.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_2_VERSION` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_2_version", "_SC_2_VERSION"
    ]()


fn get_sc_2_c_dev() raises Variant[
    SysconfDefineNotPresentError["_SC_2_C_DEV"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX.2 C language development facilities are supported.

    This function retrieves the value of the `_SC_2_C_DEV` configuration parameter
    (corresponding to POSIX2_C_DEV), which indicates whether the POSIX.2 C language
    development facilities are supported on this system.

    Returns:
      A positive value if POSIX.2 C language development facilities are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_2_C_DEV` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_2_c_dev", "_SC_2_C_DEV"
    ]()


fn get_sc_2_fort_dev() raises Variant[
    SysconfDefineNotPresentError["_SC_2_FORT_DEV"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX.2 FORTRAN development utilities are supported.

    This function retrieves the value of the `_SC_2_FORT_DEV` configuration parameter
    (corresponding to POSIX2_FORT_DEV), which indicates whether the POSIX.2 FORTRAN
    development utilities are supported on this system.

    Returns:
      A positive value if POSIX.2 FORTRAN development utilities are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_2_FORT_DEV` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_2_fort_dev", "_SC_2_FORT_DEV"
    ]()


fn get_sc_2_fort_run() raises Variant[
    SysconfDefineNotPresentError["_SC_2_FORT_RUN"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX.2 FORTRAN run-time utilities are supported.

    This function retrieves the value of the `_SC_2_FORT_RUN` configuration parameter
    (corresponding to POSIX2_FORT_RUN), which indicates whether the POSIX.2 FORTRAN
    run-time utilities are supported on this system.

    Returns:
      A positive value if POSIX.2 FORTRAN run-time utilities are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_2_FORT_RUN` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_2_fort_run", "_SC_2_FORT_RUN"
    ]()


fn get_sc_2_localedef() raises Variant[
    SysconfDefineNotPresentError["_SC_2_LOCALEDEF"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX.2 locale definition creation is supported.

    This function retrieves the value of the `_SC_2_LOCALEDEF` configuration parameter
    (corresponding to _POSIX2_LOCALEDEF), which indicates whether the POSIX.2 creation
    of locales via localedef(1) is supported on this system.

    Returns:
      A positive value if POSIX.2 locale definition creation is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_2_LOCALEDEF` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_2_localedef", "_SC_2_LOCALEDEF"
    ]()


fn get_sc_2_sw_dev() raises Variant[
    SysconfDefineNotPresentError["_SC_2_SW_DEV"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX.2 software development utilities are supported.

    This function retrieves the value of the `_SC_2_SW_DEV` configuration parameter
    (corresponding to POSIX2_SW_DEV), which indicates whether the POSIX.2 software
    development utilities option is supported on this system.

    Returns:
      A positive value if POSIX.2 software development utilities are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_2_SW_DEV` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_2_sw_dev", "_SC_2_SW_DEV"
    ]()


fn get_sc_advisory_info() raises Variant[
    SysconfDefineNotPresentError["_SC_ADVISORY_INFO"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX advisory information functions are supported.

    This function retrieves the value of the `_SC_ADVISORY_INFO` configuration parameter
    (corresponding to _POSIX_ADVISORY_INFO), which indicates whether advisory I/O functions
    are supported. If supported, the following functions are available:
    posix_fadvise(), posix_fallocate(), posix_memalign(), and posix_madvise().

    Returns:
      A positive value if advisory information functions are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_ADVISORY_INFO` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_advisory_info", "_SC_ADVISORY_INFO"
    ]()


fn get_sc_asynchronous_io() raises Variant[
    SysconfDefineNotPresentError["_SC_ASYNCHRONOUS_IO"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether asynchronous I/O is supported.

    This function retrieves the value of the `_SC_ASYNCHRONOUS_IO` configuration parameter
    (corresponding to _POSIX_ASYNCHRONOUS_IO), which indicates whether asynchronous I/O
    operations are supported. If supported, the header <aio.h> is present and the following
    functions are available: aio_cancel(), aio_error(), aio_fsync(), aio_read(),
    aio_return(), aio_suspend(), aio_write(), and lio_listio().

    Returns:
      A positive value if asynchronous I/O is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_ASYNCHRONOUS_IO` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_asynchronous_io", "_SC_ASYNCHRONOUS_IO"
    ]()


fn get_sc_barriers() raises Variant[
    SysconfDefineNotPresentError["_SC_BARRIERS"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX barriers are supported.

    This function retrieves the value of the `_SC_BARRIERS` configuration parameter
    (corresponding to _POSIX_BARRIERS), which indicates whether POSIX barrier synchronization
    is supported. This option implies the _POSIX_THREADS and _POSIX_THREAD_SAFE_FUNCTIONS
    options. If supported, the following functions are available: pthread_barrier_destroy(),
    pthread_barrier_init(), pthread_barrier_wait(), pthread_barrierattr_destroy(),
    and pthread_barrierattr_init().

    Returns:
      A positive value if barriers are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_BARRIERS` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_barriers", "_SC_BARRIERS"
    ]()


fn get_sc_clock_selection() raises Variant[
    SysconfDefineNotPresentError["_SC_CLOCK_SELECTION"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether clock selection is supported.

    This function retrieves the value of the `_SC_CLOCK_SELECTION` configuration parameter
    (corresponding to _POSIX_CLOCK_SELECTION), which indicates whether clock selection
    operations are supported. This option implies the _POSIX_TIMERS option. If supported,
    the following functions are available: pthread_condattr_getclock(), pthread_condattr_setclock(),
    and clock_nanosleep().

    Returns:
      A positive value if clock selection is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_CLOCK_SELECTION` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_clock_selection", "_SC_CLOCK_SELECTION"
    ]()


fn get_sc_cputime() raises Variant[
    SysconfDefineNotPresentError["_SC_CPUTIME"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether CPU-time clock is supported.

    This function retrieves the value of the `_SC_CPUTIME` configuration parameter
    (corresponding to _POSIX_CPUTIME), which indicates whether the CLOCK_PROCESS_CPUTIME_ID
    clock ID is supported for measuring process CPU time. This option implies the
    _POSIX_TIMERS option. If supported, the clock_getcpuclockid() function is available.

    Returns:
      A positive value if CPU-time clock is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_CPUTIME` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_cputime", "_SC_CPUTIME"
    ]()


fn get_sc_fsync() raises Variant[
    SysconfDefineNotPresentError["_SC_FSYNC"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether the fsync() function is supported.

    This function retrieves the value of the `_SC_FSYNC` configuration parameter
    (corresponding to _POSIX_FSYNC), which indicates whether the fsync() function is
    available for synchronizing file writes to storage.

    Returns:
      A positive value if fsync() is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_FSYNC` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value["mojo_sysconf_get_sc_fsync", "_SC_FSYNC"]()


fn get_sc_ipv6() raises Variant[
    SysconfDefineNotPresentError["_SC_IPV6"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether Internet Protocol Version 6 is supported.

    This function retrieves the value of the `_SC_IPV6` configuration parameter
    (corresponding to _POSIX_IPV6), which indicates whether IPv6 networking is supported
    on this system.

    Returns:
      A positive value if IPv6 is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_IPV6` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value["mojo_sysconf_get_sc_ipv6", "_SC_IPV6"]()


fn get_sc_mapped_files() raises Variant[
    SysconfDefineNotPresentError["_SC_MAPPED_FILES"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether memory-mapped files are supported.

    This function retrieves the value of the `_SC_MAPPED_FILES` configuration parameter
    (corresponding to _POSIX_MAPPED_FILES), which indicates whether shared memory and
    memory-mapped files are supported. If supported, the header <sys/mman.h> is present
    and the following functions are available: mmap(), msync(), and munmap().

    Returns:
      A positive value if memory-mapped files are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_MAPPED_FILES` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_mapped_files", "_SC_MAPPED_FILES"
    ]()


fn get_sc_memlock() raises Variant[
    SysconfDefineNotPresentError["_SC_MEMLOCK"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether memory locking is supported.

    This function retrieves the value of the `_SC_MEMLOCK` configuration parameter
    (corresponding to _POSIX_MEMLOCK), which indicates whether shared memory can be
    locked into physical memory. If supported, the following functions are available:
    mlockall() and munlockall().

    Returns:
      A positive value if memory locking is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_MEMLOCK` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_memlock", "_SC_MEMLOCK"
    ]()


fn get_sc_memlock_range() raises Variant[
    SysconfDefineNotPresentError["_SC_MEMLOCK_RANGE"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether memory range locking is supported.

    This function retrieves the value of the `_SC_MEMLOCK_RANGE` configuration parameter
    (corresponding to _POSIX_MEMLOCK_RANGE), which indicates whether specific ranges of
    memory can be locked into physical memory. If supported, the following functions are
    available: mlock() and munlock().

    Returns:
      A positive value if memory range locking is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_MEMLOCK_RANGE` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_memlock_range", "_SC_MEMLOCK_RANGE"
    ]()


fn get_sc_memory_protection() raises Variant[
    SysconfDefineNotPresentError["_SC_MEMORY_PROTECTION"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether memory protection is supported.

    This function retrieves the value of the `_SC_MEMORY_PROTECTION` configuration parameter
    (corresponding to _POSIX_MEMORY_PROTECTION), which indicates whether the mprotect()
    function is available for changing memory protection attributes.

    Returns:
      A positive value if memory protection is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_MEMORY_PROTECTION` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_memory_protection", "_SC_MEMORY_PROTECTION"
    ]()


fn get_sc_message_passing() raises Variant[
    SysconfDefineNotPresentError["_SC_MESSAGE_PASSING"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX message queues are supported.

    This function retrieves the value of the `_SC_MESSAGE_PASSING` configuration parameter
    (corresponding to _POSIX_MESSAGE_PASSING), which indicates whether POSIX message passing
    via message queues is supported. If supported, the header <mqueue.h> is present and the
    following functions are available: mq_close(), mq_getattr(), mq_notify(), mq_open(),
    mq_receive(), mq_send(), mq_setattr(), and mq_unlink().

    Returns:
      A positive value if message passing is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_MESSAGE_PASSING` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_message_passing", "_SC_MESSAGE_PASSING"
    ]()


fn get_sc_monotonic_clock() raises Variant[
    SysconfDefineNotPresentError["_SC_MONOTONIC_CLOCK"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether monotonic clock is supported.

    This function retrieves the value of the `_SC_MONOTONIC_CLOCK` configuration parameter
    (corresponding to _POSIX_MONOTONIC_CLOCK), which indicates whether the CLOCK_MONOTONIC
    clock is supported. This option implies the _POSIX_TIMERS option. If supported, the
    following functions are affected: aio_suspend(), clock_getres(), clock_gettime(),
    clock_settime(), and timer_create().

    Returns:
      A positive value if monotonic clock is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_MONOTONIC_CLOCK` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_monotonic_clock", "_SC_MONOTONIC_CLOCK"
    ]()


fn get_sc_prioritized_io() raises Variant[
    SysconfDefineNotPresentError["_SC_PRIORITIZED_IO"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether prioritized asynchronous I/O is supported.

    This function retrieves the value of the `_SC_PRIORITIZED_IO` configuration parameter
    (corresponding to _POSIX_PRIORITIZED_IO), which indicates whether one can specify
    priorities for asynchronous I/O operations. If supported, the following functions are
    affected: aio_read() and aio_write().

    Returns:
      A positive value if prioritized I/O is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_PRIORITIZED_IO` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_prioritized_io", "_SC_PRIORITIZED_IO"
    ]()


fn get_sc_priority_scheduling() raises Variant[
    SysconfDefineNotPresentError["_SC_PRIORITY_SCHEDULING"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether priority scheduling is supported.

    This function retrieves the value of the `_SC_PRIORITY_SCHEDULING` configuration parameter
    (corresponding to _POSIX_PRIORITY_SCHEDULING), which indicates whether process priority
    scheduling is supported. If supported, the header <sched.h> is present and the following
    functions are available: sched_get_priority_max(), sched_get_priority_min(),
    sched_getparam(), sched_getscheduler(), sched_rr_get_interval(), sched_setparam(),
    sched_setscheduler(), and sched_yield().

    Returns:
      A positive value if priority scheduling is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_PRIORITY_SCHEDULING` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_priority_scheduling", "_SC_PRIORITY_SCHEDULING"
    ]()


fn get_sc_reader_writer_locks() raises Variant[
    SysconfDefineNotPresentError["_SC_READER_WRITER_LOCKS"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether reader-writer locks are supported.

    This function retrieves the value of the `_SC_READER_WRITER_LOCKS` configuration parameter
    (corresponding to _POSIX_READER_WRITER_LOCKS), which indicates whether POSIX reader-writer
    locks are supported. This option implies the _POSIX_THREADS option. If supported, the
    following functions are available: pthread_rwlock_destroy(), pthread_rwlock_init(),
    pthread_rwlock_rdlock(), pthread_rwlock_tryrdlock(), pthread_rwlock_trywrlock(),
    pthread_rwlock_unlock(), pthread_rwlock_wrlock(), pthread_rwlockattr_destroy(),
    and pthread_rwlockattr_init().

    Returns:
      A positive value if reader-writer locks are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_READER_WRITER_LOCKS` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_reader_writer_locks", "_SC_READER_WRITER_LOCKS"
    ]()


fn get_sc_realtime_signals() raises Variant[
    SysconfDefineNotPresentError["_SC_REALTIME_SIGNALS"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether realtime signals are supported.

    This function retrieves the value of the `_SC_REALTIME_SIGNALS` configuration parameter
    (corresponding to _POSIX_REALTIME_SIGNALS), which indicates whether realtime signals
    are supported. If supported, the following functions are available: sigqueue(),
    sigtimedwait(), and sigwaitinfo().

    Returns:
      A positive value if realtime signals are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_REALTIME_SIGNALS` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_realtime_signals", "_SC_REALTIME_SIGNALS"
    ]()


fn get_sc_semaphores() raises Variant[
    SysconfDefineNotPresentError["_SC_SEMAPHORES"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX semaphores are supported.

    This function retrieves the value of the `_SC_SEMAPHORES` configuration parameter
    (corresponding to _POSIX_SEMAPHORES), which indicates whether POSIX semaphores are
    supported. If supported, the header <semaphore.h> is present and the following functions
    are available: sem_close(), sem_destroy(), sem_getvalue(), sem_init(), sem_open(),
    sem_post(), sem_trywait(), sem_unlink(), and sem_wait().

    Returns:
      A positive value if semaphores are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_SEMAPHORES` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_semaphores", "_SC_SEMAPHORES"
    ]()


fn get_sc_shared_memory_objects() raises Variant[
    SysconfDefineNotPresentError["_SC_SHARED_MEMORY_OBJECTS"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX shared memory objects are supported.

    This function retrieves the value of the `_SC_SHARED_MEMORY_OBJECTS` configuration parameter
    (corresponding to _POSIX_SHARED_MEMORY_OBJECTS), which indicates whether shared memory
    objects are supported. If supported, the following functions are available: mmap(),
    munmap(), shm_open(), and shm_unlink().

    Returns:
      A positive value if shared memory objects are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_SHARED_MEMORY_OBJECTS` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_shared_memory_objects", "_SC_SHARED_MEMORY_OBJECTS"
    ]()


fn get_sc_spawn() raises Variant[
    SysconfDefineNotPresentError["_SC_SPAWN"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX spawn is supported.

    This function retrieves the value of the `_SC_SPAWN` configuration parameter
    (corresponding to _POSIX_SPAWN), which indicates whether process creation via spawn
    is supported. This is useful in environments where fork() cannot be used, such as
    systems without an MMU. If supported, the header <spawn.h> and numerous spawn-related
    functions are available.

    Returns:
      A positive value if spawn is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_SPAWN` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value["mojo_sysconf_get_sc_spawn", "_SC_SPAWN"]()


fn get_sc_spin_locks() raises Variant[
    SysconfDefineNotPresentError["_SC_SPIN_LOCKS"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX spin locks are supported.

    This function retrieves the value of the `_SC_SPIN_LOCKS` configuration parameter
    (corresponding to _POSIX_SPIN_LOCKS), which indicates whether POSIX spin locks are
    supported. This option implies the _POSIX_THREADS and _POSIX_THREAD_SAFE_FUNCTIONS
    options. If supported, the following functions are available: pthread_spin_destroy(),
    pthread_spin_init(), pthread_spin_lock(), pthread_spin_trylock(), and pthread_spin_unlock().

    Returns:
      A positive value if spin locks are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_SPIN_LOCKS` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_spin_locks", "_SC_SPIN_LOCKS"
    ]()


fn get_sc_sporadic_server() raises Variant[
    SysconfDefineNotPresentError["_SC_SPORADIC_SERVER"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether sporadic server scheduling is supported.

    This function retrieves the value of the `_SC_SPORADIC_SERVER` configuration parameter
    (corresponding to _POSIX_SPORADIC_SERVER), which indicates whether the sporadic server
    scheduling policy (SCHED_SPORADIC) is supported. This option implies the
    _POSIX_PRIORITY_SCHEDULING option. If supported, the following functions are affected:
    sched_setparam() and sched_setscheduler().

    Returns:
      A positive value if sporadic server scheduling is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_SPORADIC_SERVER` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_sporadic_server", "_SC_SPORADIC_SERVER"
    ]()


fn get_sc_synchronized_io() raises Variant[
    SysconfDefineNotPresentError["_SC_SYNCHRONIZED_IO"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether synchronized I/O is supported.

    This function retrieves the value of the `_SC_SYNCHRONIZED_IO` configuration parameter
    (corresponding to _POSIX_SYNCHRONIZED_IO), which indicates whether synchronized I/O
    operations are supported. If supported, the following functions are affected: open(),
    msync(), fsync(), and fdatasync().

    Returns:
      A positive value if synchronized I/O is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_SYNCHRONIZED_IO` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_synchronized_io", "_SC_SYNCHRONIZED_IO"
    ]()


fn get_sc_thread_attr_stackaddr() raises Variant[
    SysconfDefineNotPresentError["_SC_THREAD_ATTR_STACKADDR"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether thread stack address attributes are supported.

    This function retrieves the value of the `_SC_THREAD_ATTR_STACKADDR` configuration parameter
    (corresponding to _POSIX_THREAD_ATTR_STACKADDR), which indicates whether thread stack
    address attributes are supported. If supported, the following functions are affected:
    pthread_attr_getstack(), pthread_attr_getstackaddr(), pthread_attr_setstack(),
    and pthread_attr_setstackaddr().

    Returns:
      A positive value if thread stack address attributes are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_THREAD_ATTR_STACKADDR` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_thread_attr_stackaddr", "_SC_THREAD_ATTR_STACKADDR"
    ]()


fn get_sc_thread_attr_stacksize() raises Variant[
    SysconfDefineNotPresentError["_SC_THREAD_ATTR_STACKSIZE"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether thread stack size attributes are supported.

    This function retrieves the value of the `_SC_THREAD_ATTR_STACKSIZE` configuration parameter
    (corresponding to _POSIX_THREAD_ATTR_STACKSIZE), which indicates whether thread stack size
    attributes are supported. If supported, the following functions are affected:
    pthread_attr_getstack(), pthread_attr_getstacksize(), pthread_attr_setstack(),
    and pthread_attr_setstacksize().

    Returns:
      A positive value if thread stack size attributes are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_THREAD_ATTR_STACKSIZE` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_thread_attr_stacksize", "_SC_THREAD_ATTR_STACKSIZE"
    ]()


fn get_sc_thread_cputime() raises Variant[
    SysconfDefineNotPresentError["_SC_THREAD_CPUTIME"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether thread CPU-time clock is supported.

    This function retrieves the value of the `_SC_THREAD_CPUTIME` configuration parameter
    (corresponding to _POSIX_THREAD_CPUTIME), which indicates whether the CLOCK_THREAD_CPUTIME_ID
    clock ID is supported for measuring per-thread CPU time. This option implies the _POSIX_TIMERS
    option. If supported, the following functions are affected: pthread_getcpuclockid(),
    clock_getres(), clock_gettime(), clock_settime(), and timer_create().

    Returns:
      A positive value if thread CPU-time clock is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_THREAD_CPUTIME` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_thread_cputime", "_SC_THREAD_CPUTIME"
    ]()


fn get_sc_thread_prio_inherit() raises Variant[
    SysconfDefineNotPresentError["_SC_THREAD_PRIO_INHERIT"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX thread priority inheritance is supported.

    This function retrieves the value of the `_SC_THREAD_PRIO_INHERIT` configuration parameter
    (corresponding to _POSIX_THREAD_PRIO_INHERIT), which indicates whether thread priority
    inheritance is supported. If supported, the following functions are affected:
    pthread_mutexattr_getprotocol() and pthread_mutexattr_setprotocol().

    Returns:
      A positive value if thread priority inheritance is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_THREAD_PRIO_INHERIT` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_thread_prio_inherit", "_SC_THREAD_PRIO_INHERIT"
    ]()


fn get_sc_thread_prio_protect() raises Variant[
    SysconfDefineNotPresentError["_SC_THREAD_PRIO_PROTECT"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX thread priority protection is supported.

    This function retrieves the value of the `_SC_THREAD_PRIO_PROTECT` configuration parameter
    (corresponding to _POSIX_THREAD_PRIO_PROTECT), which indicates whether priority protection
    (priority ceiling) for thread synchronization primitives is supported. If supported, the
    following functions are affected: pthread_mutex_getprioceiling(), pthread_mutex_setprioceiling(),
    pthread_mutexattr_getprioceiling(), pthread_mutexattr_getprotocol(),
    pthread_mutexattr_setprioceiling(), and pthread_mutexattr_setprotocol().

    Returns:
      A positive value if thread priority protection is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_THREAD_PRIO_PROTECT` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_thread_prio_protect", "_SC_THREAD_PRIO_PROTECT"
    ]()


fn get_sc_thread_priority_scheduling() raises Variant[
    SysconfDefineNotPresentError["_SC_THREAD_PRIORITY_SCHEDULING"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX thread priority scheduling is supported.

    This function retrieves the value of the `_SC_THREAD_PRIORITY_SCHEDULING` configuration parameter
    (corresponding to _POSIX_THREAD_PRIORITY_SCHEDULING), which indicates whether different threads
    within a process can run with different priorities and/or different schedulers. If supported,
    the following functions are affected: pthread_attr_getinheritsched(), pthread_attr_getschedpolicy(),
    pthread_attr_getscope(), pthread_attr_setinheritsched(), pthread_attr_setschedpolicy(),
    pthread_attr_setscope(), pthread_getschedparam(), pthread_setschedparam(), and pthread_setschedprio().

    Returns:
      A positive value if thread priority scheduling is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_THREAD_PRIORITY_SCHEDULING` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_thread_priority_scheduling",
        "_SC_THREAD_PRIORITY_SCHEDULING",
    ]()


fn get_sc_thread_process_shared() raises Variant[
    SysconfDefineNotPresentError["_SC_THREAD_PROCESS_SHARED"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX thread process-shared synchronization is supported.

    This function retrieves the value of the `_SC_THREAD_PROCESS_SHARED` configuration parameter
    (corresponding to _POSIX_THREAD_PROCESS_SHARED), which indicates whether synchronization
    primitives can be shared between processes. If supported, the following functions are affected:
    pthread_barrierattr_getpshared(), pthread_barrierattr_setpshared(),
    pthread_condattr_getpshared(), pthread_condattr_setpshared(), pthread_mutexattr_getpshared(),
    pthread_mutexattr_setpshared(), pthread_rwlockattr_getpshared(), and pthread_rwlockattr_setpshared().

    Returns:
      A positive value if thread process-shared synchronization is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_THREAD_PROCESS_SHARED` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_thread_process_shared", "_SC_THREAD_PROCESS_SHARED"
    ]()


fn get_sc_thread_safe_functions() raises Variant[
    SysconfDefineNotPresentError["_SC_THREAD_SAFE_FUNCTIONS"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX thread-safe functions are supported.

    This function retrieves the value of the `_SC_THREAD_SAFE_FUNCTIONS` configuration parameter
    (corresponding to _POSIX_THREAD_SAFE_FUNCTIONS), which indicates whether thread-safe versions
    of standard library functions are available. If supported, the following functions are affected:
    readdir_r(), getgrgid_r(), getgrnam_r(), getpwnam_r(), getpwuid_r(), flockfile(),
    ftrylockfile(), funlockfile(), getc_unlocked(), getchar_unlocked(), putc_unlocked(),
    putchar_unlocked(), rand_r(), strerror_r(), strtok_r(), asctime_r(), ctime_r(),
    gmtime_r(), and localtime_r().

    Returns:
      A positive value if thread-safe functions are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_THREAD_SAFE_FUNCTIONS` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_thread_safe_functions", "_SC_THREAD_SAFE_FUNCTIONS"
    ]()


fn get_sc_thread_sporadic_server() raises Variant[
    SysconfDefineNotPresentError["_SC_THREAD_SPORADIC_SERVER"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX thread sporadic server scheduling is supported.

    This function retrieves the value of the `_SC_THREAD_SPORADIC_SERVER` configuration parameter
    (corresponding to _POSIX_THREAD_SPORADIC_SERVER), which indicates whether threads can use
    sporadic server scheduling. This option implies the _POSIX_THREAD_PRIORITY_SCHEDULING option.
    If supported, the following functions are affected: sched_getparam(), sched_setparam(),
    and sched_setscheduler().

    Returns:
      A positive value if thread sporadic server scheduling is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_THREAD_SPORADIC_SERVER` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_thread_sporadic_server",
        "_SC_THREAD_SPORADIC_SERVER",
    ]()


fn get_sc_threads() raises Variant[
    SysconfDefineNotPresentError["_SC_THREADS"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX threads are supported.

    This function retrieves the value of the `_SC_THREADS` configuration parameter
    (corresponding to _POSIX_THREADS), which indicates whether basic support for POSIX threads
    is available. If supported, the header <pthread.h> is present and numerous threading functions
    are available including: pthread_atfork(), pthread_attr_destroy(), pthread_attr_getdetachstate(),
    pthread_attr_getschedparam(), pthread_attr_init(), pthread_attr_setdetachstate(),
    pthread_attr_setschedparam(), pthread_cancel(), pthread_cleanup_push(), pthread_cleanup_pop(),
    pthread_cond_broadcast(), pthread_cond_destroy(), pthread_cond_init(), pthread_cond_signal(),
    pthread_cond_timedwait(), pthread_cond_wait(), pthread_condattr_destroy(),
    pthread_condattr_init(), pthread_create(), pthread_detach(), pthread_equal(), pthread_exit(),
    pthread_getspecific(), pthread_join(), pthread_key_create(), pthread_key_delete(),
    pthread_mutex_destroy(), pthread_mutex_init(), pthread_mutex_lock(), pthread_mutex_trylock(),
    pthread_mutex_unlock(), pthread_mutexattr_destroy(), pthread_mutexattr_init(),
    pthread_once(), pthread_rwlock_destroy(), pthread_rwlock_init(), pthread_rwlock_rdlock(),
    pthread_rwlock_tryrdlock(), pthread_rwlock_trywrlock(), pthread_rwlock_unlock(),
    pthread_rwlock_wrlock(), pthread_rwlockattr_destroy(), pthread_rwlockattr_init(),
    pthread_self(), pthread_setcancelstate(), pthread_setcanceltype(), pthread_setspecific(),
    and pthread_testcancel().

    Returns:
      A positive value if POSIX threads are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_THREADS` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_threads", "_SC_THREADS"
    ]()


fn get_sc_timeouts() raises Variant[
    SysconfDefineNotPresentError["_SC_TIMEOUTS"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX timeouts are supported.

    This function retrieves the value of the `_SC_TIMEOUTS` configuration parameter
    (corresponding to _POSIX_TIMEOUTS), which indicates whether timed operations with timeouts
    are supported. If supported, the following functions are available: mq_timedreceive(),
    mq_timedsend(), pthread_mutex_timedlock(), pthread_rwlock_timedrdlock(),
    pthread_rwlock_timedwrlock(), sem_timedwait(), and posix_trace_timedgetnext_event().

    Returns:
      A positive value if timeout operations are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_TIMEOUTS` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_timeouts", "_SC_TIMEOUTS"
    ]()


fn get_sc_timers() raises Variant[
    SysconfDefineNotPresentError["_SC_TIMERS"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX interval timers are supported.

    This function retrieves the value of the `_SC_TIMERS` configuration parameter
    (corresponding to _POSIX_TIMERS), which indicates whether POSIX timer functions are
    available. If supported, the following functions are available: clock_getres(),
    clock_gettime(), clock_settime(), nanosleep(), timer_create(), timer_delete(),
    timer_gettime(), timer_getoverrun(), and timer_settime().

    Returns:
      A positive value if POSIX timers are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_TIMERS` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value["mojo_sysconf_get_sc_timers", "_SC_TIMERS"]()


fn get_sc_trace() raises Variant[
    SysconfDefineNotPresentError["_SC_TRACE"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX tracing is supported.

    This function retrieves the value of the `_SC_TRACE` configuration parameter
    (corresponding to _POSIX_TRACE), which indicates whether POSIX process tracing is available.
    If supported, numerous trace management functions are present including:
    posix_trace_attr_destroy(), posix_trace_attr_getclockres(), posix_trace_attr_getcreatetime(),
    posix_trace_attr_getgenversion(), posix_trace_attr_getmaxdatasize(),
    posix_trace_attr_getmaxsystemeventsize(), posix_trace_attr_getmaxusereventsize(),
    posix_trace_attr_getname(), posix_trace_attr_getstreamfullpolicy(),
    posix_trace_attr_getstreamsize(), posix_trace_attr_init(), posix_trace_attr_setmaxdatasize(),
    posix_trace_attr_setname(), posix_trace_attr_setstreamsize(),
    posix_trace_attr_setstreamfullpolicy(), posix_trace_clear(), posix_trace_create(),
    posix_trace_event(), posix_trace_eventid_equal(), posix_trace_eventid_get_name(),
    posix_trace_eventid_open(), posix_trace_eventtypelist_getnext_id(),
    posix_trace_eventtypelist_rewind(), posix_trace_flush(), posix_trace_get_attr(),
    posix_trace_get_status(), posix_trace_getnext_event(), posix_trace_shutdown(),
    posix_trace_start(), posix_trace_stop(), and posix_trace_trygetnext_event().

    Returns:
      A positive value if POSIX tracing is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_TRACE` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value["mojo_sysconf_get_sc_trace", "_SC_TRACE"]()


fn get_sc_trace_event_filter() raises Variant[
    SysconfDefineNotPresentError["_SC_TRACE_EVENT_FILTER"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX trace event filtering is supported.

    This function retrieves the value of the `_SC_TRACE_EVENT_FILTER` configuration parameter
    (corresponding to _POSIX_TRACE_EVENT_FILTER), which indicates whether trace event filtering
    is supported. This option implies the _POSIX_TRACE option. If supported, the following
    functions are present: posix_trace_eventset_add(), posix_trace_eventset_del(),
    posix_trace_eventset_empty(), posix_trace_eventset_fill(), posix_trace_eventset_ismember(),
    posix_trace_get_filter(), posix_trace_set_filter(), and posix_trace_trid_eventid_open().

    Returns:
      A positive value if trace event filtering is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_TRACE_EVENT_FILTER` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_trace_event_filter", "_SC_TRACE_EVENT_FILTER"
    ]()


fn get_sc_trace_inherit() raises Variant[
    SysconfDefineNotPresentError["_SC_TRACE_INHERIT"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX trace inheritance is supported.

    This function retrieves the value of the `_SC_TRACE_INHERIT` configuration parameter
    (corresponding to _POSIX_TRACE_INHERIT), which indicates whether tracing children of
    the traced process is supported. This option implies the _POSIX_TRACE option. If supported,
    the following functions are present: posix_trace_attr_getinherited() and
    posix_trace_attr_setinherited().

    Returns:
      A positive value if trace inheritance is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_TRACE_INHERIT` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_trace_inherit", "_SC_TRACE_INHERIT"
    ]()


fn get_sc_trace_log() raises Variant[
    SysconfDefineNotPresentError["_SC_TRACE_LOG"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX trace logging is supported.

    This function retrieves the value of the `_SC_TRACE_LOG` configuration parameter
    (corresponding to _POSIX_TRACE_LOG), which indicates whether trace event logging to
    files is supported. This option implies the _POSIX_TRACE option. If supported, the
    following functions are present: posix_trace_attr_getlogfullpolicy(),
    posix_trace_attr_getlogsize(), posix_trace_attr_setlogfullpolicy(),
    posix_trace_attr_setlogsize(), posix_trace_close(), posix_trace_create_withlog(),
    posix_trace_open(), and posix_trace_rewind().

    Returns:
      A positive value if trace logging is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_TRACE_LOG` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_trace_log", "_SC_TRACE_LOG"
    ]()


fn get_sc_typed_memory_objects() raises Variant[
    SysconfDefineNotPresentError["_SC_TYPED_MEMORY_OBJECTS"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether POSIX typed memory objects are supported.

    This function retrieves the value of the `_SC_TYPED_MEMORY_OBJECTS` configuration parameter
    (corresponding to _POSIX_TYPED_MEMORY_OBJECTS), which indicates whether typed memory object
    operations are supported. If supported, the following functions are available:
    posix_mem_offset(), posix_typed_mem_get_info(), and posix_typed_mem_open().

    Returns:
      A positive value if typed memory objects are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_TYPED_MEMORY_OBJECTS` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_typed_memory_objects", "_SC_TYPED_MEMORY_OBJECTS"
    ]()


fn get_sc_xopen_crypt() raises Variant[
    SysconfDefineNotPresentError["_SC_XOPEN_CRYPT"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether X/OPEN encryption functions are supported.

    This function retrieves the value of the `_SC_XOPEN_CRYPT` configuration parameter
    (corresponding to _XOPEN_CRYPT), which indicates whether X/OPEN encryption functions
    are supported. If supported, the following functions are available: crypt(), encrypt(),
    and setkey().

    Returns:
      A positive value if X/OPEN encryption functions are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_XOPEN_CRYPT` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_xopen_crypt", "_SC_XOPEN_CRYPT"
    ]()


fn get_sc_xopen_realtime() raises Variant[
    SysconfDefineNotPresentError["_SC_XOPEN_REALTIME"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether X/OPEN realtime extensions are supported.

    This function retrieves the value of the `_SC_XOPEN_REALTIME` configuration parameter
    (corresponding to _XOPEN_REALTIME), which indicates whether X/OPEN realtime extensions
    are supported. If supported, this implies a broad set of realtime-related options including
    asynchronous I/O, memory mapping, memory locking, message passing, and timer support.

    Returns:
      A positive value if X/OPEN realtime extensions are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_XOPEN_REALTIME` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_xopen_realtime", "_SC_XOPEN_REALTIME"
    ]()


fn get_sc_xopen_realtime_threads() raises Variant[
    SysconfDefineNotPresentError["_SC_XOPEN_REALTIME_THREADS"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether X/OPEN realtime threads are supported.

    This function retrieves the value of the `_SC_XOPEN_REALTIME_THREADS` configuration parameter
    (corresponding to _XOPEN_REALTIME_THREADS), which indicates whether X/OPEN realtime thread
    extensions are supported. If supported, this implies support for thread priority inheritance,
    priority protection, and priority scheduling.

    Returns:
      A positive value if X/OPEN realtime threads are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_XOPEN_REALTIME_THREADS` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_xopen_realtime_threads",
        "_SC_XOPEN_REALTIME_THREADS",
    ]()


fn get_sc_xopen_streams() raises Variant[
    SysconfDefineNotPresentError["_SC_XOPEN_STREAMS"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether X/OPEN streams are supported.

    This function retrieves the value of the `_SC_XOPEN_STREAMS` configuration parameter
    (corresponding to _XOPEN_STREAMS), which indicates whether X/OPEN STREAMS I/O is supported.
    If supported, the following functions are available: fattach(), fdetach(), getmsg(),
    getpmsg(), ioctl(), isastream(), putmsg(), and putpmsg().

    Returns:
      A positive value if X/OPEN streams are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_XOPEN_STREAMS` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_xopen_streams", "_SC_XOPEN_STREAMS"
    ]()


fn get_sc_xopen_legacy() raises Variant[
    SysconfDefineNotPresentError["_SC_XOPEN_LEGACY"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether X/OPEN legacy functions are supported.

    This function retrieves the value of the `_SC_XOPEN_LEGACY` configuration parameter
    (corresponding to _XOPEN_LEGACY), which indicates whether legacy X/OPEN functions are
    supported. These functions were previously mandatory but are now optional. If supported,
    the following functions are present: bcmp(), bcopy(), bzero(), ecvt(), fcvt(), ftime(),
    gcvt(), getwd(), index(), mktemp(), rindex(), utimes(), and wcswcs().

    Returns:
      A positive value if X/OPEN legacy functions are supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_XOPEN_LEGACY` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_xopen_legacy", "_SC_XOPEN_LEGACY"
    ]()


fn get_sc_xopen_unix() raises Variant[
    SysconfDefineNotPresentError["_SC_XOPEN_UNIX"],
    SysconfInvalidArgumentError,
    SysconfNotPosixSystemError,
] -> c_long:
    """Gets whether X/OPEN UNIX system interface is supported.

    This function retrieves the value of the `_SC_XOPEN_UNIX` configuration parameter
    (corresponding to _XOPEN_UNIX), which indicates whether the X/OPEN UNIX system interface
    is supported. If supported, memory mapping functions (mmap(), munmap(), msync()) are
    available, and this implies support for file synchronization, mapped files, memory
    protection, thread attributes, thread functions, and potentially other X/OPEN option groups.

    Returns:
      A positive value if X/OPEN UNIX system interface is supported,
      -1 if not supported.

    Raises:
      SysconfDefineNotPresentError: If the `_SC_XOPEN_UNIX` parameter is not supported
        on this system.
      SysconfInvalidArgumentError: If an invalid argument error occurs during the
        system call.
      SysconfNotPosixSystemError: If the system does not support POSIX standards.
    """
    return _get_mojo_sysconf_value[
        "mojo_sysconf_get_sc_xopen_unix", "_SC_XOPEN_UNIX"
    ]()
