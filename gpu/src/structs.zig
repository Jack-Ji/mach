//! Structures which are not ABI compatible with webgpu.h
const Buffer = @import("Buffer.zig");
const Sampler = @import("Sampler.zig");
const TextureView = @import("TextureView.zig");
const CompilationMessageType = @import("enums.zig").CompilationMessageType;
const PrimitiveTopology = @import("enums.zig").PrimitiveTopology;
const IndexFormat = @import("enums.zig").IndexFormat;
const FrontFace = @import("enums.zig").FrontFace;
const CullMode = @import("enums.zig").CullMode;

pub const BindGroupEntry = struct {
    binding: u32,
    buffer: Buffer,
    offset: u64,
    size: u64,
    sampler: Sampler,
    texture_view: TextureView,
};

pub const BufferBindingLayout = struct {
    type: Buffer.BindingType,
    has_dynamic_offset: bool,
    min_binding_size: u64,
};

pub const CompilationMessage = struct {
    message: [:0]const u8,
    type: CompilationMessageType,
    line_num: u64,
    line_pos: u64,
    offset: u64,
    length: u64,
};

pub const MultisampleState = struct {
    count: u32,
    mask: u32,
    alpha_to_coverage_enabled: bool,
};

pub const PrimitiveState = struct {
    topology: PrimitiveTopology,
    strip_index_format: IndexFormat,
    front_face: FrontFace,
    cull_mode: CullMode,
};

test "syntax" {
    _ = BindGroupEntry;
    _ = BufferBindingLayout;
    _ = CompilationMessage;
    _ = MultisampleState;
    _ = PrimitiveState;
}
