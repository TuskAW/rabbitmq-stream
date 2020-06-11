PROJECT = rabbitmq_stream
PROJECT_DESCRIPTION = RabbitMQ Stream
PROJECT_MOD = rabbit_stream

define PROJECT_ENV
[
	{tcp_listeners, [5555]},
	{num_tcp_acceptors, 10},
	{num_ssl_acceptors, 10},
	{tcp_listen_options, [{backlog,   128},
                          {nodelay,   true}]},
	{initial_credits, 50000},
	{credits_required_for_unblocking, 12500},
	{frame_max, 1048576},
	{heartbeat, 600},
	{advertised_host, undefined},
	{advertised_port, undefined}
]
endef


DEPS = rabbit
TEST_DEPS = rabbitmq_ct_helpers

DEP_EARLY_PLUGINS = rabbit_common/mk/rabbitmq-early-plugin.mk
DEP_PLUGINS = rabbit_common/mk/rabbitmq-plugin.mk

# FIXME: Use erlang.mk patched for RabbitMQ, while waiting for PRs to be
# reviewed and merged.

ERLANG_MK_REPO = https://github.com/rabbitmq/erlang.mk.git
ERLANG_MK_COMMIT = rabbitmq-tmp

include rabbitmq-components.mk
include erlang.mk
