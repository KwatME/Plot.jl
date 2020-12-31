using Plotly: plot, scatter

function plot_x_y(
    x_::Tuple{Vararg{Vector{<:Real}}},
    y_::Tuple{Vararg{Vector{<:Real}}};
    name_ = nothing,
)
    n_trace = length(x_)

    if name_ === nothing
        name_ = Tuple(string(index) for index in 1:n_trace)
    end

    trace_ = [Dict{String, Any}() for index in 1:n_trace]

    for index in 1:n_trace
        trace_[index]["x"] = x_[index]

        trace_[index]["y"] = y_[index]

        trace_[index]["name"] = name_[index]
    end

    data = [scatter(trace) for trace in trace_]

    return display(plot(data))
end

function plot_x_y(y_; kwargs...)
    x_ = Tuple(collect(1:length(y)) for y in y_)

    return plot_x_y(x_, y_; kwargs...)
end

export plot_x_y